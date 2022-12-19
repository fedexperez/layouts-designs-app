import 'package:flutter/material.dart';

import 'package:emergency_layout/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.routes;
    final routeName = menuOptions.keys.elementAt;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Layouts'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(routeName(index)[0].toUpperCase() +
              routeName(index).substring(1).toLowerCase()),
          onTap: () {
            Navigator.pushNamed(context, routeName(index));
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length - 1,
      ),
    );
  }
}
