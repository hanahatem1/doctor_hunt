import 'package:doctor_hunt/apps/features/auth/presentation/pages/login_page.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/pages/sign_up_page.dart';
import 'package:doctor_hunt/apps/features/on_boarding/pages/on_boarding_pages.dart';
import 'package:doctor_hunt/apps/features/role_selection/pages/role_selection_screen.dart';
import 'package:go_router/go_router.dart';



abstract class AppRouter {

  static const String kOnboarding = '/';
  static const String kRoleSelection = '/roleSelection';
  static const String kLogin = '/login';
  static const String kSignUp = '/signUp';

  static final router = GoRouter(
    initialLocation: kOnboarding,
    routes: [
      GoRoute(
        path: kOnboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: kRoleSelection,
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => const SignUpPage(),
      ),
    ],
  );
}