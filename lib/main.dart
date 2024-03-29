import 'package:car_sale_app/model/view-models/car-view-model.dart';
import 'package:car_sale_app/theme/color.dart';
import 'package:car_sale_app/views/explore-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  setUpLocator();

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CarViewModel())
          ],
          child: const MyApp()
      )


  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: appPrimaryColor),
            useMaterial3: true,
            appBarTheme: AppBarTheme(color: appPrimaryColor),
            // scaffoldBackgroundColor: appBackgroundColor,
          ),
          home: const ExploreScreen(),
          builder: EasyLoading.init(),
        ),
    );
  }
}
