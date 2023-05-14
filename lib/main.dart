import 'package:fetstival_app/utils/routes.dart';
import 'package:fetstival_app/views/screens/add_information.dart';
import 'package:fetstival_app/views/screens/homepage.dart';
import 'package:fetstival_app/views/screens/poster.dart';
import 'package:fetstival_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: MyRoutes.Splash_Screen_Page,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.add_info: (context) => const add_info(),
        MyRoutes.poster: (context) => const poster(),
        MyRoutes.Splash_Screen_Page: (context) => const Splash_Screen_Page(),
      },
    );
  }
}
