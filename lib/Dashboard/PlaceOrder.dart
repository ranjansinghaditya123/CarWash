import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

 var status;
addUserAddress(String address1, String address2,) async{

  final response = await  http.post("http://shineurcar.com/api/place-order",
      headers: {
        'Accept':'application/json',
        'authorization' : 'Bearer '+'13aQo5mKwQJUTTrUS9BnCbd5g',
      },
      body: {
        "address_1" : "$address1",
        "address_2": "$address2",
      }

  ) ;
  status = response.body.contains('error');

  var data = json.decode(response.body);

  if(status){
    print('data : ${data["error"]}');
  }else{
    print('data : ${data["token"]}');
    _save(data["token"]);
  }

}


_save(String token,) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  prefs.setString(key, value);
  prefs.setString('token', token);
}













class _PlaceOrderState extends State<PlaceOrder>{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
