import 'package:doctor_appointement_project/core/helpers/spacing.dart';
import 'package:doctor_appointement_project/core/theming/colors.dart';
import 'package:doctor_appointement_project/core/theming/style.dart';
import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsSpecilaityListViewItem extends StatelessWidget {
  const DoctorsSpecilaityListViewItem({
    super.key,
    required this.index,
    required this.specializationsData,
  });
  final int? index;
  final SpecializationsData specializationsData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.lightBlue,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              width: 40.w,
              height: 40.h,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData.name ?? 'Specializations',
            style: AppTextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
