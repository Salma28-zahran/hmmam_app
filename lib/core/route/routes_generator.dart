import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/features/auth/forget_password/presentation/views/check_email.dart';
import 'package:hmmam_app/features/auth/forget_password/presentation/views/forget_password.dart';
import 'package:hmmam_app/features/auth/forget_password/presentation/views/reset_password.dart';
import 'package:hmmam_app/features/auth/login/presentation/views/login_screen.dart';
import 'package:hmmam_app/features/auth/regiser/presentation/views/activate_screen.dart';
import 'package:hmmam_app/features/auth/regiser/presentation/views/signup_screen.dart';
import 'package:hmmam_app/features/home/presentation/views/home_screen.dart';
import 'package:hmmam_app/features/onboarding/OnBoarding.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.signup:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
          settings: settings,
        );
      case PageRouteName.active:
        return MaterialPageRoute(
          builder: (context) => const ActivateScreen(),
          settings: settings,
        );
      case PageRouteName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      case PageRouteName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );

      case PageRouteName.forget:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
          settings: settings,
        );
      case PageRouteName.check:
        return MaterialPageRoute(
          builder: (context) => const CheckEmail(),
          settings: settings,
        );
      case PageRouteName.reset:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
          settings: settings,
        );


      default:
        return MaterialPageRoute(
          builder: (context) => OnBoarding(),
          settings: settings,
        );
    }
  }
}
