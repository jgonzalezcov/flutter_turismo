import 'package:flutter/material.dart';
import 'package:tourist/screens/screens.dart' as screens;

class AppRoutes {
  static const initialRouter = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (context) => const screens.HomeView(),
    'detailplace': (context) => const screens.DetailView()
  };
}
