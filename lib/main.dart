import 'package:car_wash/Dashboard/Umap.dart';
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
      home: Umap(),
    );
  }
}
