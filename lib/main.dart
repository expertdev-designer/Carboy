import 'package:carboy/ui/navigation/navigation_bar.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      color: Colors.deepOrange,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const CarBoyNavigationBar(),
    );
  }
}
