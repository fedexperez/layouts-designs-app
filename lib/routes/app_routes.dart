import 'package:flutter/material.dart';

import 'package:emergency_layout/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'emergencies': (BuildContext context) => const EmergencyScreen(),
    'slivers': (BuildContext context) => const SliverListScreen(),
    'home': (BuildContext context) => const HomeScreen(),
  };
}
