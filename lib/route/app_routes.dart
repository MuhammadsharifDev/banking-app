import 'package:banking_app/presintation/auth/login/bloc/login_bloc.dart';
import 'package:banking_app/presintation/auth/login/login_page.dart';
import 'package:banking_app/presintation/auth/signup/bloc/signup_bloc.dart';
import 'package:banking_app/presintation/auth/signup/signup_page.dart';
import 'package:banking_app/presintation/main/home/detail/detail_page.dart';
import 'package:banking_app/presintation/main/home/history/history_page.dart';
import 'package:banking_app/presintation/main/home/home_page.dart';
import 'package:banking_app/route/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupBloc(),
            child: const SignupPage(),
          ),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginPage(),
          ),
        );
      case RoutesName.history:
        return MaterialPageRoute(
          builder: (context) => const HistoryPage(),
        );
      case RoutesName.detail:
        return MaterialPageRoute(
          builder: (context) => const DetailPage(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
