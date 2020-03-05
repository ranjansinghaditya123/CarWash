
//                                                 SCREEN 3 OF ON BOARDING PAGE

import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget{

  @override

  _Screen3State createState() => _Screen3State();

}

class _Screen3State extends State<Screen3> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/back6.jpg')
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 320,
            width: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'images/loc.jpg',
                  )),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
          ),
          Container(
            child: Text(
              'GREAT LOCATION',
              style: TextStyle(
                fontSize: 30,
                color: Colors.pink,
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Container(
            child: Text('Great food at',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                )),
          ),
          Container(
            child: Text('Afordable price for',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                )),
          ),
          Container(
            child: Text(' Board meetings and celebrations', style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
            )),
          ),
        ],
      ),
    );
  }
}
