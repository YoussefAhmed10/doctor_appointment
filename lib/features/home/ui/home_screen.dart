import 'package:doctor_appointement_project/core/helpers/spacing.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/doctors_blue_container.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/doctors_speciality_see_all.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/home_top_bar.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/specialitions_doctors_bolc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(16),
              const SetupSpecialitionsDoctorsBolcBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
