import 'package:doctor_hunt/apps/core/router/app_router.dart';
import 'package:doctor_hunt/apps/features/on_boarding/widgets/on_boarding_page_item.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      context.pushReplacement(AppRouter.kRoleSelection);
    }
  }

  void _handleSkipPressed() {
  context.pushReplacement(AppRouter.kRoleSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
Positioned(
  top: 0,
  left: _currentIndex == 1 ? null : 0,
  right: _currentIndex == 1 ? 0 : null,
  child: Transform.flip(
    flipX: _currentIndex == 1,
    child: Image.asset(
      AppImages.ellipsepageview,
    ),
  ),
),

          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImages.splash2, 
            ),
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
                centerImage: AppImages.pageview1, 
                title: 'Find Trusted Doctors',             
                description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                buttonText: 'Next',                      
                onNextPressed: _handleNextPressed,
                onSkipPressed: _handleSkipPressed,
              ),

              OnboardingPageItem(
                centerImage: AppImages.pageview2, 
                title: 'Choose Best Doctors',            
                description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                buttonText: 'Next',                       
                onNextPressed: _handleNextPressed,
                onSkipPressed: _handleSkipPressed,
              ),

              OnboardingPageItem(
                centerImage: AppImages.pageview3, 
                title: 'Easy Appointments',              
                description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
                buttonText: 'Get Started',                
                onNextPressed: _handleNextPressed,
                onSkipPressed: _handleSkipPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}