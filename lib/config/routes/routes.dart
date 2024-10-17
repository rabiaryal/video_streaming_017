

import 'package:flutter/material.dart';
import 'package:video_streaming_bloc_017/config/routes/route_name.dart';
import 'package:video_streaming_bloc_017/view/homepage.dart';




class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.splash:
      //   return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());

      // case RoutesName.login:
      //   return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
