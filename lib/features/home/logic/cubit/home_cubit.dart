import 'package:doctor_appointement_project/core/helpers/extensions.dart';
import 'package:doctor_appointement_project/core/networking/api_error_handler.dart';
import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointement_project/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specializationDataList = [];

  void getSpecializationData() async {
    emit(const HomeState.specializationLoading());
    final respone = await _homeRepo.getSpecializationData();
    respone.when(
      success: (specializationsResponseModel) {
        specializationDataList =
            specializationsResponseModel.specializationDataList ?? [];
        getDoctorsData(
            specializationId: specializationDataList!.first?.id ?? 1);
        emit(
          HomeState.specializationSuccess(specializationDataList),
        );
      },
      failure: (errorHandler) => emit(
        HomeState.specializationError(errorHandler),
      ),
    );
  }

  void getDoctorsData({required int specializationId}) async {
    List<Doctors?> doctorsList = getDoctorsListBySpecializationId(
      specializationId: specializationId,
    );
    if (!doctorsList.isNullOrEmpty()) {
      emit(
        HomeState.doctorsSuccess(doctorsList),
      );
    } else {
      emit(
        HomeState.doctorsError(
          ApiErrorHandler.handle('No doctors found'),
        ),
      );
    }
  }

  /// return doctors list by specialization id
  getDoctorsListBySpecializationId({required int specializationId}) {
    return specializationDataList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
