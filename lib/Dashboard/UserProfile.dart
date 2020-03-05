import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Icon(Icons.location_searching,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Icon(Icons.add_shopping_cart,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Icon(Icons.history,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Icon(Icons.account_circle,color: Colors.purple,),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 350,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 70,
                    left: 80,
                    right: 80,
                    child: Container(
                      child: CircleAvatar(
                        radius: 125,
                        backgroundImage: AssetImage('images/pic.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 240,
                    left: 220,
                    child: FlatButton(
                      onPressed: () {},
                      child: Container(
                        child: Icon(
                          Icons.edit,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(

                children: <Widget>[
                  SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  Container(
                    child: Text(
                      'Aditya Ranjan Singh',
                      style: TextStyle(fontSize: 35, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                    width: double.infinity,
                  ),
                  Container(
                    child: Text(
                      'A_d_i_t_y_a',
                      style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 35,
                    width: double.infinity,
                  ),
                  Container(
                    child: Text(
                      'A paragraph is a series of sentences that are organized and ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Text(
                      'and are all related to a single topic. Almost every piece of',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Text(
                      'writing you do that is longer than a few sentences',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              color: Colors.amber[100],
            ),
          ],
        ),
      ],
    ));
  }
}
