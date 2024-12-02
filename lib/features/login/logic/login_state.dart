import 'package:doctor_appointement_project/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.loginInitial() = _LoignInitial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess(T data) = LoginSuccess;
  const factory LoginState.loginError(ApiErrorModel apiErrorModel) = LoginError;
}
