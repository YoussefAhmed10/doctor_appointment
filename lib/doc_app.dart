import 'package:doctor_appointement_project/core/routing/app_router.dart';
import 'package:doctor_appointement_project/core/routing/routes.dart';
import 'package:doctor_appointement_project/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        title: 'Doc App',
        theme: ThemeData(
          primaryColor: ColorsManger.mainBlueColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
