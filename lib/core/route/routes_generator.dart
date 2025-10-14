import 'package:flutter/material.dart';
import 'package:hmmam_app/core/route/routes.dart';
import 'package:hmmam_app/features/account/presentation/views/account_screen.dart';
import 'package:hmmam_app/features/auth/forget_password/presentation/views/check_email.dart';
import 'package:hmmam_app/features/auth/forget_password/presentation/views/forget_password.dart';
import 'package:hmmam_app/features/auth/forget_password/presentation/views/reset_password.dart';
import 'package:hmmam_app/features/auth/login/presentation/views/login_screen.dart';
import 'package:hmmam_app/features/auth/regiser/presentation/views/activate_screen.dart';
import 'package:hmmam_app/features/auth/regiser/presentation/views/signup_screen.dart';
import 'package:hmmam_app/features/home/presentation/views/NearbyWheelchairScreen.dart';
import 'package:hmmam_app/features/home/presentation/views/directions.dart';
import 'package:hmmam_app/features/home/presentation/views/home_screen.dart';
import 'package:hmmam_app/features/main/presentation/views/main_screen.dart';
import 'package:hmmam_app/features/notifications/presentation/views/notifications_screen.dart';
import 'package:hmmam_app/features/onboarding/OnBoarding.dart';
import 'package:hmmam_app/features/orders/presentation/views/orders_screen.dart';
import 'package:hmmam_app/features/saved/presentation/views/saved_screen.dart';

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
      case PageRouteName.main:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
          settings: settings,
        );
      case PageRouteName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case PageRouteName.orders:
        return MaterialPageRoute(
          builder: (context) => const OrdersScreen(),
          settings: settings,
        );
      case PageRouteName.account:
        return MaterialPageRoute(
          builder: (context) =>  AccountScreen(),
          settings: settings,
        );
      case PageRouteName.saved:
        return MaterialPageRoute(
          builder: (context) => const SavedScreen(),
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
      case PageRouteName.nearby:
        return MaterialPageRoute(
          builder: (context) => const NearbyWheelchairScreen(),
          settings: settings,
        );
      case PageRouteName.directions:
        return MaterialPageRoute(
          builder: (context) => const Directions(),
          settings: settings,
        );
      case PageRouteName.notifications:
        return MaterialPageRoute(
          builder: (context) => const NotificationsScreen(),
          settings: settings,
        );



      default:
        return MaterialPageRoute(
         builder: (context) => OnBoarding(),
         // builder: (context)=> MainScreen(),
          settings: settings,
        );
    }
  }
}
