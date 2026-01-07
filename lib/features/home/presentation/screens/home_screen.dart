import 'package:doctor_reservation_app/features/home/presentation/widget/home_top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.fromLTRB(
          20,
          16,
          20,
          16,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopBar(),
          ],
        ),
      )),
    );
  }
}
