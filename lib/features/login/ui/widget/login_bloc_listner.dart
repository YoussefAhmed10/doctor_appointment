import 'package:doctor_appointement_project/core/helpers/extensions.dart';
import 'package:doctor_appointement_project/core/routing/routes.dart';
import 'package:doctor_appointement_project/core/theming/colors.dart';
import 'package:doctor_appointement_project/core/theming/style.dart';
import 'package:doctor_appointement_project/features/login/logic/login_cubit.dart';
import 'package:doctor_appointement_project/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlue,
                ),
              ),
            );
          },
          loginSuccess: (loginResponse) {
            context.goBack();
            context.pushNamed(Routes.homeScreen);
          },
          loginError: (apiErrorModel) {
            setupErrorState(context, apiErrorModel.getAllErrorMessage());
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String errorMessage) {
    context.goBack();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          errorMessage,
          style: AppTextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.goBack();
            },
            child: Text(
              'Got it',
              style: AppTextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
