import 'package:doctor_appointement_project/core/theming/colors.dart';
import 'package:doctor_appointement_project/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi JOo!',
              style: AppTextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are You Today?',
              style: AppTextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: AppColors.moreLighterGray,
          child: SvgPicture.asset(
            'assets/svgs/notification.svg',
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
