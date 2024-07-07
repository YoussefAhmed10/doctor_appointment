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
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.goBack();
            context.pushNamed(Routes.homeScreen);
          },
          error: (errorMessage) {
            setupErrorState(context, errorMessage);
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
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.goBack();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
