import 'package:car_sale_app/theme/color.dart';
import 'package:car_sale_app/views/explore-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColor),
          useMaterial3: true,
          appBarTheme: AppBarTheme(color: appPrimaryColor),
          // scaffoldBackgroundColor: appBackgroundColor,
        ),
        home: const ExploreScreen(),
        // builder: EasyLoading.init(),
      );
  }
}
