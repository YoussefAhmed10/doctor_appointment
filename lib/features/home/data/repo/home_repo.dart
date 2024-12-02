import 'package:doctor_appointement_project/core/networking/api_error_handler.dart';
import 'package:doctor_appointement_project/core/networking/api_result.dart';
import 'package:doctor_appointement_project/features/home/data/apis/home_api_services.dart';
import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';

class HomeRepo {
  final HomeApiServices _homeApiServices;

  HomeRepo(this._homeApiServices);
  Future<ApiResult<SpecializationsResponseModel>>
      getSpecializationData() async {
    try {
      final response = await _homeApiServices.getSpecializationData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error.toString()));
    }
  }
}
