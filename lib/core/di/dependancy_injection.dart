import 'package:dio/dio.dart';
import 'package:doctor_appointement_project/core/networking/api_service.dart';
import 'package:doctor_appointement_project/core/networking/dio_factory.dart';
import 'package:doctor_appointement_project/features/login/data/repos/login_repo.dart';
import 'package:doctor_appointement_project/features/login/logic/login_cubit.dart';
import 'package:doctor_appointement_project/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doctor_appointement_project/features/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login repo
  getit.registerLazySingleton<LoginRepository>(() => LoginRepository(getit()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit()));

  // signup
  getit.registerLazySingleton<SignupRepo>(() => SignupRepo(getit()));
  getit.registerFactory<SignupCubit>(() => SignupCubit(getit()));
}
