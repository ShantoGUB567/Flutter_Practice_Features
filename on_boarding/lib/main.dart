import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/features/home/screen/home_sceen.dart';
import 'package:on_boarding/features/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Oboarding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
