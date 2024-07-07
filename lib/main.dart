import 'package:doctor_appointement_project/core/di/dependancy_injection.dart';
import 'package:doctor_appointement_project/core/routing/app_router.dart';
import 'package:doctor_appointement_project/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
