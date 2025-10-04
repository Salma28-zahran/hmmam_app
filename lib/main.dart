import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes_generator.dart';



void main() {
  runApp(
       const MyApp(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
        );
      },
    );
  }
}
