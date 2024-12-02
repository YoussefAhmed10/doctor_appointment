import 'package:doctor_appointement_project/core/networking/api_error_model.dart';
import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //specialization
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
          List<SpecializationsData?>? specializationDataList) =
      SpecializationSuccess;
  const factory HomeState.specializationError(ApiErrorModel apiErrorModel) =
      SpecializationError;
  // Doctors

  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError(ApiErrorModel apiErrorModel) =
      DoctorsError;
}
