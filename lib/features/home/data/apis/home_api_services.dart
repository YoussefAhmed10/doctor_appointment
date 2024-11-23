import 'package:dio/dio.dart';
import 'package:doctor_appointement_project/core/networking/api_constants.dart';
import 'package:doctor_appointement_project/features/home/data/apis/home_api_constants.dart';
import 'package:doctor_appointement_project/features/home/data/models/specialization_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiServices {
  factory HomeApiServices(Dio dio) => _HomeApiServices(dio);

  @GET(HomeApiConstants.specialization)
  Future<SpecializationsResponseModel> getSpecializationData();
}
