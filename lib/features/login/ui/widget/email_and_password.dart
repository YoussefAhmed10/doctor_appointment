import 'package:doctor_appointement_project/core/helpers/app_rejex.dart';
import 'package:doctor_appointement_project/core/helpers/spacing.dart';
import 'package:doctor_appointement_project/core/widgets/app_text_from_field.dart';
import 'package:doctor_appointement_project/features/login/logic/login_cubit.dart';
import 'package:doctor_appointement_project/features/login/ui/widget/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool isminimumLength = false;
  @override
  void initState() {
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListeners();
    super.initState();
  }

  void setupPasswordControllerListeners() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        isminimumLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            controller: emailController,
            validator: (val) {
              if (val!.isEmpty || !AppRegex.isEmailValid(val)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Password',
            controller: passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                !isObscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please enter password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
            hasSpecialChar: hasSpecialChar,
            isminimumLength: isminimumLength,
          ),
        ],
      ),
    );
  }
}
