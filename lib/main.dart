import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/constants.dart';
import 'screens/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndaBand',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryColor,
      ),
      home: HomeScreen(),
    );
  }
}
