import 'package:doctor_appointement_project/core/di/dependancy_injection.dart';
import 'package:doctor_appointement_project/core/helpers/constants.dart';
import 'package:doctor_appointement_project/core/helpers/extensions.dart';
import 'package:doctor_appointement_project/core/helpers/shared_pref_helper.dart';
import 'package:doctor_appointement_project/core/routing/app_router.dart';
import 'package:doctor_appointement_project/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // this line to fix fix text being hidden in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
