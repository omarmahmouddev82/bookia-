import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/ui/login_screen.dart';
import 'package:bookia/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => AuthCubit(),
              child: LoginScreen(),
            );
          },
        );
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
