import 'package:doctor_appointement_project/core/theming/style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          'HOme Screen',
          style: TextStyles.font13GrayRegular,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
