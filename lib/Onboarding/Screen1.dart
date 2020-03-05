
//                                                 SCREEN 1 OF ON BOARDING PAGE


import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget{
  @override
  _Screen1State createState() => _Screen1State();

}

class _Screen1State extends State<Screen1>{

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
                    'images/2934.jpg',
                  )),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
          ),
          Container(
            child: Text(
              'GREAT FACILITY',
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
            child: Text('City accomodation',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                )),
          ),
          Container(
            child: Text(' Good transportation facility ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepOrange,
                )),
          ),
          Container(
            child: Text('To xplore beautifull city and its culture', style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
            )),
          ),
        ],
      ),
    );
  }
}
