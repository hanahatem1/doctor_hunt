import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  int selectedIndex = 1;

  final List<Map<String, String>> slotsData = [
    {
      'date': 'Today, 23 Feb',
      'slots': 'No slots available',
    },
    {
      'date': 'Tomorrow, 24 Feb',
      'slots': '9 slots available',
    },
    {
      'date': 'Thu, 25 Feb',
      'slots': '10 slots available',
    },
    {
      'date': 'Fri, 26 Feb',
      'slots': '5 slots available',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: slotsData.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final item = slotsData[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : AppColors.textBorders,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['date']!,
                    style: isSelected
                        ? context.bold13White
                        : context.bold13TextMain,
                  ),
                  3.h,
                  Text(
                    item['slots']!,
                    style: isSelected
                        ? context.regular11White
                        : context.regular11TextSub,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}