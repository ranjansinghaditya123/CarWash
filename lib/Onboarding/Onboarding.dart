
//                                                       ON BOARDING PAGE

import 'package:flutter/material.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget{

  @override

  _OnboardingState createState() => _OnboardingState();

}

class _OnboardingState extends State<Onboarding> {

  PageController controller;

  void getChangedPageAndMoveBar(int page){

    currentPageValue = page;

    setState(() {});
  }
  int currentPageValue;

  final List<Widget> introWidgetsList = <Widget>[

    Screen1(),
    Screen2(),
    Screen3(),


  ];

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.yellowAccent,
    ));

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: introWidgetsList.length,
                  onPageChanged: (int page) {
                    getChangedPageAndMoveBar(page);
                  },
                  controller: controller,
                  itemBuilder: (context, index) {
                    return introWidgetsList[index];
                  }),
              Visibility(visible: currentPageValue == introWidgetsList.length - 1 ? true : false,
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.deepOrange,
                    onPressed:(){},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(26))),
                    child: Text('GET STARTED',style: TextStyle(color: Colors.white),),
                  ),
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
