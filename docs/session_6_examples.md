# S6 — Teaching Examples

## How to use this file

This document is an instructor preparation reference for **Session 6: Constraints & Advanced Layout** in the Advanced Flutter course. 

It maps key Flutter layout concepts to concrete examples found in the **Doctor Hunt** project, alongside targeted standalone and intentionally broken examples.

Before your session:
1. Review the **"What I should ask students"** questions (in Egyptian Arabic) to spark interactive discussion before showing code.
2. Run or demonstrate the snippet to explain **WHY** Flutter behaves the way it does (the 3-rule mental model: *Constraints go down, Sizes go up, Parents set position*).
3. Use Section 9 for your quick-reference list of the top 6 live demonstration examples.

---

# 1. Layout Mental Model

## Example 1.1 — Expanded Flex Allocation in Onboarding Page

**Type:** EXISTS IN PROJECT

**Where:**
[on_boarding_page_item.dart](file:///d:/Coding/Flutter/doctor_hunt/lib/apps/features/on_boarding/widgets/on_boarding_page_item.dart#L23-L73) — `OnboardingPageItem` class.

**What exists now:**
The `Column` inside `OnboardingPageItem` contains an `Expanded` wrapping the top image/text content, followed by a `Padding` containing `CustomButton` and a `TextButton` ("Skip").

**Teaching point:**
Demonstrates the 3-step Flutter layout pipeline:
1. **Constraints go down**: `Column` gives loose height constraints to non-flex children (`CustomButton`, `Skip`), measures them, subtracts their height from max available height, then passes **tight height constraints** to `Expanded`.
2. **Sizes go up**: `Expanded` passes its forced height constraint to its child `Padding`, which sizes itself to fill that exact height.
3. **Parent sets position**: `Column` places `Expanded` at `y = 0`, `CustomButton` below it, and `Skip` button at the bottom.

**What I should ask students:**
- "تفتكروا ليه الصورة والنص واخدين كل المساحة المتبقية فوق، بينما الزرار تحت ثابت في مكانه؟"
- "لو شلنا `Expanded` من حوالين الـ `Padding` بتاع الصورة، الـ `Column` هينسق نفسه ازاي؟"

**Current code:**
```dart
Column(
  children: [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(/* Image Circle */),
            40.h,
            Text(title, style: context.bold24GrayDark),
            16.h,
            Text(description, style: context.regular14TextSub),
          ],
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: CustomButton(title: buttonText, onPress: onNextPressed),
    ),
    TextButton(onPressed: onSkipPressed, child: Text(tr.skip)),
    16.h,
  ],
)
```

**Problem / Observation:**
Notice that `Expanded` receives tight height constraints from `Column`. Inside `Expanded`, there is an inner `Column` with `mainAxisAlignment: MainAxisAlignment.center`. This forces the inner content to center vertically within the exact height allocated by `Expanded`.

**What students should learn:**
`Expanded` does not just "stretch" widgets; it intercepts parent constraints and forces tight constraints on its child equal to the remaining unallocated space.

---

## Example 1.2 — Spacer inside Unbounded vs Bounded Height

**Type:** POTENTIAL TEACHING OPPORTUNITY

**Where:**
[role_selection_screen.dart](file:///d:/Coding/Flutter/doctor_hunt/lib/apps/features/role_selection/screens/role_selection_screen.dart#L35-L95) — `RoleSelectionScreen` class.

**What exists now:**
`RoleSelectionScreen` uses a `Column` inside `AuthBackground` (which provides bounded screen height via `SafeArea`). The `Column` contains `const Spacer()` before the `CustomButton`.

**Teaching point:**
`Spacer()` is an `Expanded(child: SizedBox.shrink())`. It requires bounded constraints in the flex direction. In `RoleSelectionScreen`, `AuthBackground` gives bounded constraints, so `Spacer()` successfully pushes the button to the bottom. If this screen were wrapped in a `SingleChildScrollView`, `Spacer()` would throw a runtime `RenderFlex` layout error.

**What I should ask students:**
- "الـ `Spacer()` ده شغّال ممتاز هنا وبيزق الزرار لتحت.. إيه اللي هيحصل لو الكلاينت طلب يخلي الشاشة كلها بتسكرول مع الكيبورد وحطينا `SingleChildScrollView` بره الـ `Column`؟"

**Current code:**
```dart
// role_selection_screen.dart
AuthBackground(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      children: [
        20.h,
        /* Title & Role Cards */
        const Spacer(), // <--- Works because parent Column has bounded height
        CustomButton(
          title: tr.continueText,
          onPress: _onContinuePressed,
        ),
        20.h,
      ],
    ),
  ),
)
```

**Better approach (if wrapped in SingleChildScrollView):**
If scrolling is added, replace `Spacer()` with `CustomSizedBox` / `Height` or use `ConstrainedBox` + `IntrinsicHeight`:

```dart
SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(minHeight: constraints.maxHeight),
    child: IntrinsicHeight(
      child: Column(
        children: [
          /* Header & Cards */
          const Spacer(), // Now works safely inside scroll view
          CustomButton(/* ... */),
        ],
      ),
    ),
  ),
)
```

**What students should learn:**
`Spacer` and `Expanded` require bounded constraints from their parent. Wrapping a flex widget in a scrollview removes max constraints in the scroll direction, causing `Expanded`/`Spacer` to fail.

---

# 2. BoxConstraints

## Example 2.1 — Tight vs Loose Constraints in CustomButton

**Type:** EXISTS IN PROJECT

**Where:**
[custom_button.dart](file:///d:/Coding/Flutter/doctor_hunt/lib/apps/core/widgets/custom_button.dart#L56-L95) — `CustomButton` class.

**What exists now:**
`CustomButton` sets default parameter `width = double.infinity` and wraps its inner layout in a `Container(width: width, height: height)`.

**Teaching point:**
Demonstrates how `width: double.infinity` transforms loose horizontal constraints into **tight max-width constraints** bounded by the parent's constraints.

**What I should ask students:**
- "لما بنكتب `width: double.infinity` جوه ودجيت.. هل ده معناه إن العرض هيبقى لا نهائي فعلاً والشاشة هتضرب ولا إيه اللي بيحصل؟"

**Current code:**
```dart
class CustomButton extends StatelessWidget {
  final double width;
  final double height;

  const CustomButton({
    this.width = double.infinity,
    this.height = 52,
    // ...
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,   // double.infinity
      height: height, // 52.0
      decoration: BoxDecoration(/* ... */),
      child: /* Button Content */,
    );
  }
}
```

**Problem / Observation:**
`double.infinity` tells the `Container` to be as wide as possible. The parent (e.g., `Padding` with 24px horizontal margin) imposes a maximum constraint of `screenWidth - 48`. The `Container` respects the parent's max constraint, tightening its width to `screenWidth - 48`.

**What students should learn:**
A child can never exceed the `maxWidth` or `maxHeight` imposed by its parent, no matter how large its requested size is.

---

## Example 2.2 — Forcing Loose Constraints with UnconstrainedBox

**Type:** STANDALONE EXAMPLE

**Goal:**
Demonstrate what happens when you want a child widget to ignore a parent's tight constraints and render at its natural size.

**Code:**
```dart
// Standalone Example: Tight vs Loose Constraint Override
SizedBox(
  width: 200,
  height: 50,
  child: UnconstrainedBox(
    child: Container(
      width: 300, // Wants to be wider than the 200px parent!
      height: 50,
      color: Colors.red,
      child: const Center(child: Text("Unconstrained Child")),
    ),
  ),
)
```

**Ask students:**
- "الـ `SizedBox` عاطي عرض 200.. والـ `Container` اللي جواه عاوز عرض 300.. إيه اللي هيحصل لما نرن الكود ده؟"

**Expected result:**
The red `Container` will render at 300px width, overflowing the 200px parent boundary and showing a yellow/black striped overflow warning.

**Why:**
`UnconstrainedBox` passes **loose infinite constraints** (`minWidth: 0, maxWidth: double.infinity`) to its child, allowing the child to choose any size it wants. However, `UnconstrainedBox` itself is still constrained to 200px by `SizedBox`, resulting in an overflow error.

**Fix:**
Use `SingleChildScrollView(scrollDirection: Axis.horizontal)` or adjust parent constraints.

**What students should learn:**
`UnconstrainedBox` removes incoming tight constraints from parent to child, allowing you to observe raw child sizing behavior and overflow mechanics.

---

# 3. Bounded vs Unbounded Constraints

## Example 3.1 — SingleChildScrollView Passing Unbounded Height to Column

**Type:** EXISTS IN PROJECT

**Where:**
[login_screen.dart](file:///d:/Coding/Flutter/doctor_hunt/lib/apps/features/auth/presentation/screens/login_screen.dart#L23-L40) — `LoginPage` class.

**What exists now:**
`SingleChildScrollView` wraps a `Column` containing text fields, social buttons, and standard spacing (`16.h`, `32.h`).

**Teaching point:**
`SingleChildScrollView` provides **unbounded vertical constraints** (`maxHeight: double.infinity`) to its child `Column`. The `Column` measures the total sum of all its children's heights without restricting them.

**What I should ask students:**
- "ليه لو حطينا `Expanded` جوه الـ `Column` هنا هيحصل Error فوري أول ما الشاشة تفتح؟"

**Current code:**
```dart
AuthBackground(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          50.h,
          Text(tr.welcomeBack, style: context.bold24TextMain),
          12.h,
          SocialButtonsRow(/* ... */),
          32.h,
          CustomTextField(hintText: tr.emailHint),
          16.h,
          CustomTextField(hintText: tr.passwordHint),
          32.h,
          CustomButton(title: tr.login, onPress: () {}),
        ],
      ),
    ),
  ),
)
```

**Problem / Observation:**
Because `SingleChildScrollView` allows infinite vertical height, any child widget asking "how much space is left?" (like `Expanded` or `Spacer`) will receive `double.infinity` as the available space, causing a layout failure:
`RenderFlex children have non-zero flex but incoming height constraints are unbounded.`

**What students should learn:**
Scroll views remove parent max constraints in their scrolling direction. You must never place an unconstrained `Expanded` or `Spacer` directly inside a scrollable `Column`.

---

## Example 3.2 — Unbounded Height Crash: Column + ListView

**Type:** INTENTIONALLY BROKEN EXAMPLE

**Goal:**
Demonstrate the classic layout bug when putting a `ListView` directly inside a `Column`.

**Code:**
```dart
// BROKEN CODE EXAMPLE
Column(
  children: [
    Text("Doctor List"),
    ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(title: Text("Doctor $index")),
    ),
  ],
)
```

**Ask students:**
- "الكود ده هيشتغل تمام ويكتب العنوان واللستة تحته، ولا هيضرب؟ وليه؟"

**Expected result:**
Red screen of death with `Vertical viewport was given unbounded height` exception.

**Why:**
- `Column` passes unbounded vertical height constraints (`maxHeight: double.infinity`) to its children.
- `ListView` by default wants to expand to fill all available vertical space (`maxHeight`).
- `ListView` receives infinite height constraint, cannot calculate its viewport bounds, and throws a runtime exception.

**Fix Option A (Bounded via Expanded):**
```dart
Column(
  children: [
    Text("Doctor List"),
    Expanded( // Forces tight height bounded by remaining Column space
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(title: Text("Doctor $index")),
      ),
    ),
  ],
)
```

**Fix Option B (Non-scrollable in-line list via shrinkWrap):**
```dart
Column(
  children: [
    Text("Doctor List"),
    ListView.builder(
      shrinkWrap: true, // Forces ListView to calculate total child height
      physics: const NeverScrollableScrollPhysics(), // Disable inner scroll
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(title: Text("Doctor $index")),
    ),
  ],
)
```

**Why the fixes work:**
- **Option A** gives the `ListView` bounded height constraints via `Expanded`.
- **Option B** tells `ListView` to measure all items and shrink its height to match total content height.

**Important trade-off:** Option B (`shrinkWrap: true`) evaluates ALL items immediately, destroying `ListView.builder` lazy-rendering performance benefits.

---

# 4. Scrolling Models

## Example 4.1 — SingleChildScrollView for Forms vs ListView

**Type:** POTENTIAL TEACHING OPPORTUNITY

**Where:**
[sign_up_screen.dart](file:///d:/Coding/Flutter/doctor_hunt/lib/apps/features/auth/presentation/screens/sign_up_screen.dart#L24-L88) — `SignUpPage` class.

**What exists now:**
`SignUpPage` uses `SingleChildScrollView` containing a static `Column` of form fields (`Name`, `Email`, `Password`, `Checkbox`, `CustomButton`).

**Teaching point:**
Choosing the correct scrollable model:
- Use `SingleChildScrollView` when you have a **fixed, known number of children** (e.g. form screens) to prevent keyboard overflow (`BOTTOM OVERFLOWED BY XX PIXELS`).
- Use `ListView.builder` when you have **dynamic or long lists** of data that benefit from lazy item instantiation and recycling.

**What I should ask students:**
- "ليه استخدمنا `SingleChildScrollView` في شاشة التسجيل بدل ما نستخدم `ListView`؟ هل في فرق جوهري في الأداء بين الاتنين في الشاشة دي؟"

**Current code:**
```dart
SingleChildScrollView(
  child: Column(
    children: [
      40.h,
      Text(tr.signUpTitle, style: context.bold24TextMain),
      12.h,
      Text(tr.signUpSubTitle, textAlign: TextAlign.center),
      32.h,
      SocialButtonsRow(/* ... */),
      28.h,
      CustomTextField(hintText: tr.nameHint),
      16.h,
      CustomTextField(hintText: tr.emailHint),
      16.h,
      CustomTextField(hintText: tr.passwordHint),
      16.h,
      /* Terms Checkbox & Buttons */
    ],
  ),
)
```

**What students should learn:**
`SingleChildScrollView` eagerly constructs its entire child tree. For small static forms, this has zero performance penalty and cleanly handles keyboard resize. For 100+ items, it causes frame drops.

---

# 5. Nested Scrollables & shrinkWrap

## Example 5.1 — The Anatomy and Cost of shrinkWrap: true

**Type:** STANDALONE EXAMPLE

**Goal:**
Demonstrate what `shrinkWrap: true` actually does under the hood and why it impacts performance on large datasets.

**Code:**
```dart
// DEMO: Performance Cost of shrinkWrap
SingleChildScrollView(
  child: Column(
    children: [
      Text("Featured Doctors", style: TextStyle(fontSize: 20)),
      ListView.builder(
        shrinkWrap: true, // <--- Forces total layout calculation
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1000, // 1000 Items!
        itemBuilder: (context, index) {
          print("Building item $index"); // Will print ALL 1000 items instantly!
          return ListTile(title: Text("Doctor #$index"));
        },
      ),
    ],
  ),
)
```

**Ask students:**
- "لو عندنا 1000 عنصر في القائمة دي وحطينا `shrinkWrap: true`.. تفتكروا كم عنصر هيتبني في الـ Memory أول ما الشاشة تفتح؟"

**Expected result:**
All 1000 `ListTile` items will be instantiated immediately upon opening the screen, causing a noticeable UI freeze (jank) during screen transition.

**Why:**
1. A standard `ListView` asks the parent for maximum available height and only builds items visible inside its viewport window.
2. Under `shrinkWrap: true`, `ListView` tells its layout delegate: *"I don't know my size until I measure EVERY single child element."*
3. It iterates through all 1000 items, measures their height, sums them up, and sets its container height. Lazy building is completely disabled.

**Better approach (Restructuring the Widget Tree):**
Instead of nesting `SingleChildScrollView` + `ListView(shrinkWrap: true)`, use a single `CustomScrollView` with `Slivers` (see Section 8).

**What students should learn:**
`shrinkWrap: true` is not a magic fix for layout errors. It changes the scrollable from lazy-viewport evaluation to eager O(N) child measurement.

---

# 6. LayoutBuilder vs MediaQuery

## Example 6.1 — Parent Constraints (LayoutBuilder) vs Window Size (MediaQuery)

**Type:** STANDALONE EXAMPLE

**Goal:**
Demonstrate why using `MediaQuery.of(context).size.width` for widget responsiveness breaks in nested layouts, split-screen, or dialogs, and why `LayoutBuilder` is the correct tool for component-level responsiveness.

**Code:**
```dart
// DEMO: MediaQuery vs LayoutBuilder Comparison
Row(
  children: [
    // Left Sidebar (Fixed 250px)
    Container(width: 250, color: Colors.blueGrey),
    
    // Right Content Area (Responsive)
    Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // constraints.maxWidth gives AVAILABLE width for this widget (e.g. 500px on an 750px screen)
          // MediaQuery.of(context).size.width gives TOTAL screen width (750px)
          bool isCompact = constraints.maxWidth < 400;
          
          return Container(
            color: isCompact ? Colors.orange : Colors.green,
            child: Center(
              child: Text(
                isCompact ? "Compact Layout (${constraints.maxWidth}px)" 
                          : "Wide Layout (${constraints.maxWidth}px)",
              ),
            ),
          );
        },
      ),
    ),
  ],
)
```

**Ask students:**
- "لو الشاشة عرضها الكلي 800px.. والـ Sidebar واخد 300px.. الـ `MediaQuery` هترايبورت كام والـ `LayoutBuilder` هيقرأ كام؟ مين فيهم الأنسب لو بنعمل Reusable Card Component؟"

**Why the distinction matters:**
- `MediaQuery.of(context).size`: Returns the **global device window size**. It knows nothing about sidebar drawers, paddings, or parent container bounds.
- `LayoutBuilder`: Returns the **local BoxConstraints** passed down by the immediate parent widget.

**What students should learn:**
Use `MediaQuery` for screen-level orientation or system safe areas. Use `LayoutBuilder` for component-level responsive styling based on actual available parent space.

---

# 7. Responsive & Adaptive Layout

## Example 7.1 — Breakpoint-Based Layout Using Constraints

**Type:** STANDALONE EXAMPLE

**Goal:**
Demonstrate responsive layout switching based on available width breakpoints (< 600px vs >= 600px) rather than device type names.

**Code:**
```dart
class ResponsiveRoleSelector extends StatelessWidget {
  const ResponsiveRoleSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Breakpoint based on available parent width
        if (constraints.maxWidth < 600) {
          // Narrow Screen / Mobile View: Vertical Stack
          return Column(
            children: const [
              RoleCardWidget(title: "Patient", subtitle: "..."),
              SizedBox(height: 16),
              RoleCardWidget(title: "Admin", subtitle: "..."),
            ],
          );
        } else {
          // Wide Screen / Tablet / Desktop View: Side-by-Side Row
          return Row(
            children: const [
              Expanded(child: RoleCardWidget(title: "Patient", subtitle: "...")),
              SizedBox(width: 16),
              Expanded(child: RoleCardWidget(title: "Admin", subtitle: "...")),
            ],
          );
        }
      },
    );
  }
}
```

**Ask students:**
- "ليه بنفضل نحدد الـ Breakpoint على حسب المساحة المتاحة (زي `constraints.maxWidth < 600`) بدل ما نكتب إف كونديشن بتقول `isTablet`؟"

**Why:**
A tablet in split-screen mode might only have 400px of available width. A mobile phone in landscape mode might have 700px. Responsive design must react to **available layout constraints**, not hardware device names.

**What students should learn:**
Responsive code should evaluate `BoxConstraints.maxWidth` at breakpoints to dynamically switch between `Column` and `Row` layouts.

---

# 8. CustomScrollView & Slivers

## Example 8.1 — Replacing Nested Scrollables with a Single CustomScrollView

**Type:** STANDALONE EXAMPLE / POTENTIAL TEACHING OPPORTUNITY

**Goal:**
Demonstrate how to combine a pinned header, a static section, and a dynamic list into a single unified scroll view without nesting or `shrinkWrap`.

**Code:**
```dart
// Unified Sliver-based Layout for Doctor Hunt Feature Page
CustomScrollView(
  slivers: [
    // 1. Collapsible / Pinned Header
    const SliverAppBar(
      pinned: true,
      expandedHeight: 160.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("Doctor Hunt"),
        background: FlutterLogo(),
      ),
    ),

    // 2. Static Header Content inside SliverToBoxAdapter
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Find Your Specialist", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Select from top-rated doctors near your location."),
          ],
        ),
      ),
    ),

    // 3. Efficient Lazy List of Doctors
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text("Doctor #$index"),
            subtitle: const Text("Cardiologist — 5 Stars"),
          );
        },
        childCount: 50, // Lazily built!
      ),
    ),
  ],
)
```

**Ask students:**
- "ليه الـ `CustomScrollView` مع الـ `Slivers` أحسن بكتير في الأداء والهيدر من لما نعمل `SingleChildScrollView` وجواه `ListView` بـ `shrinkWrap`؟"

**Why it is better:**
1. **Single Scroll Viewport**: There is only one scroll physics controller. No nested scroll conflicts or inner scrollbar fighting.
2. **Lazy Rendering Maintained**: `SliverList` only builds items currently visible in the scroll viewport.
3. **Advanced Scroll Effects**: `SliverAppBar` smoothly collapses and pins as the user scrolls.

**What students should learn:**
When a screen contains both static sections and dynamic lists, `CustomScrollView` with `SliverToBoxAdapter` and `SliverList` is the gold standard for performance and scroll integration.

---

# 9. Best Examples To Actually Use In The Session

Here are the top 6 most impactful live teaching examples selected for **Session 6**:

| # | Example Name | Concept Taught | Source | Approx. Time |
|---|---|---|---|---|
| **1** | **Expanded Flex Allocation** ([on_boarding_page_item.dart](file:///d:/Coding/Flutter/doctor_hunt/lib/apps/features/on_boarding/widgets/on_boarding_page_item.dart#L23-L73)) | Flutter 3-rule mental model (*Constraints down, sizes up, parent positions*) | `EXISTS IN PROJECT` | 10 mins |
| **2** | **Tight Constraints via double.infinity** ([custom_button.dart](file:///d:/Coding/Flutter/doctor_hunt/lib/apps/core/widgets/custom_button.dart#L56-L95)) | How children transform incoming parent loose constraints to max tight constraints | `EXISTS IN PROJECT` | 8 mins |
| **3** | **Unbounded Height Crash: Column + ListView** | Why `Column` + `ListView` crashes with infinite height error & how `Expanded` fixes it | `INTENTIONALLY BROKEN` | 15 mins |
| **4** | **The Real Cost of shrinkWrap: true** | How `shrinkWrap` disables lazy viewport rendering and causes performance jank | `STANDALONE EXAMPLE` | 12 mins |
| **5** | **LayoutBuilder vs MediaQuery** | Local parent constraints vs global window size in component responsiveness | `STANDALONE EXAMPLE` | 12 mins |
| **6** | **Unified Slivers Architecture** | Replacing messy nested scrollables with `CustomScrollView` + `SliverList` | `STANDALONE EXAMPLE` | 15 mins |

---
*End of S6 Teaching Examples Reference File.*
