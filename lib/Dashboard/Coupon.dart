import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Coupon extends StatefulWidget{
  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {

  String code;

  List CODEN = [] ;

  _codedetails () async {

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+'13aQo5mKwQJUTTrUS9BnCbd5g'};





    var data =  await http.get("http://shineurcar.com/api/service-list", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){
      CODEN = jsondata;
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Container(
            height: 780,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/logo.jpg'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                      width: double.infinity,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Enter Your Code',
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Enter your coupoun code to avail'
                              'the offer',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter Coupoun Code',
                          helperStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.pink)),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
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
                        onPressed: () {},
                        child: Text(
                          'Place Order',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}