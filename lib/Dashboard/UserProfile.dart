import 'dart:developer';
import 'package:car_wash/Dashboard/AddAddress.dart';
import 'package:car_wash/Dashboard/MyOrders.dart';
import 'package:car_wash/Dashboard/CarServices.dart';
import 'package:flutter/services.dart';
import 'package:car_wash/Dashboard/Umap.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:car_wash/Dashboard/UpdateAddress.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  
  String address1;
  String address2;
  String city ;
  String state;

  String data; // wallet balance

  List walletvalue = [];
  List Address = [];

  _walletDetails () async {


    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+'13aQo5mKwQJUTTrUS9BnCbd5g'};

    var data =  await http.get("http://shineurcar.com/api/wallet", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){
      walletvalue = jsondata;
    }
    );
  }


  _addressDetails () async {


    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+'13aQo5mKwQJUTTrUS9BnCbd5g'};

    var data =  await http.get("http://shineurcar.com/api/get-address", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){
      Address = jsondata;
    }
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    _addressDetails();
    _walletDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Umap()),
                    );
                  },
                  child: Icon(Icons.location_searching,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CarServices()),
                    );
                  },
                  child: Icon(Icons.add_shopping_cart,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()),
                    );
                  },
                  child: Icon(Icons.history,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),
                    );
                  },
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

                ListView.builder(
                  itemCount: walletvalue.length,
                    itemBuilder:(BuildContext context , int index){
                    return                   Row(
                      children: <Widget>[
                    Container(
                    child: Text(
                      'Wallet balance',
                      style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                    ),
                      margin: EdgeInsets.all(5),
                      ),
                      Container(
                      child: Text(walletvalue[index]['data'],
                      style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
                      ),
                      margin: EdgeInsets.all(5),
                      ),
                      ],
                      );
                    }
                ),
                  SizedBox(
                    height:20,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 35,
                    width: double.infinity,
                  ),
                  ListView.builder(
                    itemCount: Address.length,
                      itemBuilder:(BuildContext context , int index){
                      return Column(
                        children: <Widget>[
                          Container(
                            child: Text(Address[index]['address_1'],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text(Address[index]['address_2'],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text(Address[index]['city_name'],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            child: Text(Address[index]['State_name'],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ) ;
                      }
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        )),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddress()),
                        );
                      },
                      child: Text(
                        'Add Address',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        )),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateAddress()),
                        );
                      },
                      child: Text(
                        'Update Address',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
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
