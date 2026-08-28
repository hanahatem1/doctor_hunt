import 'package:doctor_hunt/apps/core/router/app_router.dart';
import 'package:doctor_hunt/apps/features/on_boarding/widgets/on_boarding_page_item.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _handleNextPressed() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      const RoleSelectionRoute().go(context);
    }
  }

  void _handleSkipPressed() {
    const RoleSelectionRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CR: don't add expanded in scaffold just stack is enough
      body: Expanded(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: _currentIndex == 1 ? null : 0,
              right: _currentIndex == 1 ? 0 : null,
              child: Transform.flip(
                flipX: _currentIndex == 1,
                child: Image.asset(AppImages.pngEllipsepageview),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(AppImages.pngSplash2),
            ),
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                OnboardingPageItem(
                  centerImage: AppImages.pngPageview1,
                  title: tr.findTrustedDoctors,
                  description: tr.onboardingDesc,
                  buttonText: tr.next,
                  onNextPressed: _handleNextPressed,
                  onSkipPressed: _handleSkipPressed,
                ),
                OnboardingPageItem(
                  centerImage: AppImages.pngPageview2,
                  title: tr.chooseBestDoctors,
                  description: tr.onboardingDesc,
                  buttonText: tr.next,
                  onNextPressed: _handleNextPressed,
                  onSkipPressed: _handleSkipPressed,
                ),
                OnboardingPageItem(
                  centerImage: AppImages.pngPageview3,
                  title: tr.easyAppointments,
                  description: tr.onboardingDesc,
                  buttonText: tr.getStarted,
                  onNextPressed: _handleNextPressed,
                  onSkipPressed: _handleSkipPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
