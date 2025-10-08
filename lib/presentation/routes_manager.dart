import 'package:flutter/material.dart';

import 'contact/contact_view.dart';
import 'faqs/faqs_view.dart';
import 'home/home_view.dart';
import 'settings/settings_view.dart';
import 'splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String faqRoute = '/faq';
  static const String settingsRoute = '/settings';
  static const String contactRoute = '/contact';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.faqRoute:
        return MaterialPageRoute(builder: (_) => const FaqsView());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case Routes.contactRoute:
        return MaterialPageRoute(builder: (_) => const ContactView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Rota Inexistente')),
        body: const Center(
          child: Text('Rota Inexistente'),
        ),
      ),
    );
  }
}
