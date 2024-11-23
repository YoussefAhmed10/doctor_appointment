import 'package:doctor_appointement_project/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSpecializationData() async {
    emit(const HomeState.specializationLoading());
    final respone = await _homeRepo.getSpecializationData();
    respone.when(
      success: (specializationsResponseModel) => emit(
        HomeState.specializationSuccess(specializationsResponseModel),
      ),
      failure: (errorHandler) => emit(
        HomeState.specializationError(errorHandler),
      ),
    );
  }
}
