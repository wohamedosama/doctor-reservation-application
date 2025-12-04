import 'package:doctor_reservation_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
        backgroundColor: AppColor.primaryColorSurface,
      ),
    );
  }
}
