
import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/features/auth/regiser/presentation/views/signup_screen.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
        case PageRouteName.signup:
            return MaterialPageRoute(
                builder: (context) => const SignupScreen(),
                settings: settings,
            );

        default:
            return MaterialPageRoute(
                builder: (context) => const SignupScreen(),
                settings: settings,
            );

    }
  }
}
