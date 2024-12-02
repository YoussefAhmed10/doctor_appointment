import 'package:doctor_appointement_project/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? code;
  final String? message;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errorsData;

  ApiErrorModel({this.code, this.message, this.errorsData});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessage() {
    if (errorsData.isNullOrEmpty()) return message ?? "Unknown error occured";
    final errorMeassge = errorsData!.entries.map((entery) {
      final value = entery.value;
      return "${value.join(", ")}";
    }).join('\n');
    return errorMeassge;
  }
}
