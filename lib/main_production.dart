import 'package:doctor_appointement_project/core/di/dependancy_injection.dart';
import 'package:doctor_appointement_project/core/routing/app_router.dart';
import 'package:doctor_appointement_project/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // this line to fix fix text being hidden in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // statusBarColor: Color(0xffb72227),
      statusBarColor: Color(0xffb72227),
      systemNavigationBarColor: Colors.green,
    ),
  );
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
