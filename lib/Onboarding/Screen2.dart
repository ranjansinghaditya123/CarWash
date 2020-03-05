
//                                                   SCREEN 2 OF ON BOARDING PAGE

import 'package:flutter/material.dart';



class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/back6.jpg')
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'images/1911.jpg',
                  )),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
          ),
          Container(
            child: Text(
              'CONVENIENT SERVICES',
              style: TextStyle(
                fontSize: 30,
                color: Colors.deepOrange,
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Container(
            child: Text('Car Wash at',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                )),
          ),
          Container(
            child: Text('Afordable price with all',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                )),
          ),
          Container(
            child: Text(' Amenities  available at your reach', style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
            )),
          ),
        ],
      ),
    );
  }
}
