import 'package:doctor_appointement_project/core/helpers/spacing.dart';
import 'package:doctor_appointement_project/core/theming/colors.dart';
import 'package:doctor_appointement_project/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointement_project/features/home/logic/cubit/home_state.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/doctors_list_view.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupSpecialitionsDoctorsBolcBuilder extends StatelessWidget {
  const SetupSpecialitionsDoctorsBolcBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () => setupLoading(),
          specializationSuccess: (specializationsResponseModel) {
            var specializationList =
                specializationsResponseModel.specializationDataList;
            return setupSucess(specializationList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return SizedBox(
      height: 100.h,
      child: const CircularProgressIndicator(
        color: AppColors.mainBlue,
      ),
    );
  }

  Widget setupSucess(specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationList: specializationList ?? [],
          ),
          verticalSpace(8),
          DoctorsListView(
            doctorsList: specializationList?[0]?.doctorsList ?? [],
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
