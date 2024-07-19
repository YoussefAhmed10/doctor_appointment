import 'package:doctor_appointement_project/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointement_project/features/login/data/repos/login_repo.dart';
import 'package:doctor_appointement_project/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repo;
  LoginCubit(this._repo) : super(const LoginState.initial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _repo.login(
      loginRequestBody: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
