import 'package:flutter/material.dart';

import 'package:water_count_app/pages/home/home_page.dart';

import 'pages/adding_water_page.dart/adding_water_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/addWater': (_) => const AddingWaterPage(),
      },
    );
  }
}
