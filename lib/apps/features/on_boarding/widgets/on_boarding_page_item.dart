import 'package:flutter/material.dart';

class OnboardingPageItem extends StatelessWidget {
  final String centerImage;     
  final String title;           
  final String description;     
  final String buttonText;      
  final VoidCallback onNextPressed; 
  final VoidCallback onSkipPressed; 

  const OnboardingPageItem({
    super.key,
    required this.centerImage,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onNextPressed,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(centerImage), 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF677294),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: onNextPressed, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0FCE92),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  buttonText, 
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: onSkipPressed, 
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF677294),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}