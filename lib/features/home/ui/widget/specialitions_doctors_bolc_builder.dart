import 'package:doctor_appointement_project/core/helpers/spacing.dart';
import 'package:doctor_appointement_project/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointement_project/features/home/logic/cubit/home_state.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/doctros_list/doctors_shimmer_loading.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/specializations_list/speciality_list_view.dart';
import 'package:doctor_appointement_project/features/home/ui/widget/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
          specializationSuccess: (specializationDataList) {
            var specializationList = specializationDataList;
            return setupSucess(specializationList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  /// shimmer loading for specializations and doctors
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSucess(specializationList) {
    return SpecialityListView(
      specializationList: specializationList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
