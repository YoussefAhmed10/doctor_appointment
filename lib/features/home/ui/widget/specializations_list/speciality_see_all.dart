import 'package:doctor_appointement_project/core/theming/style.dart';
import 'package:flutter/material.dart';

class SpecialitySeeAll extends StatelessWidget {
  const SpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors Speciality',
          style: AppTextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        Text(
          'See All',
          style: AppTextStyles.font12BlueRegular,
        ),
      ],
    );
  }
}
