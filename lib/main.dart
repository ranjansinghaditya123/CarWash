import 'package:car_wash/Dashboard/Services.dart';
import 'package:car_wash/Onboarding/Onboarding.dart';
import 'package:car_wash/Test.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
void main() => runApp(MyApp(),);
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}
