import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PlaceOrder extends StatefulWidget {

  PlaceOrder(this.code) : super();

  final String code;


  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}
class _PlaceOrderState extends State<PlaceOrder>{

  SharedPreferences sharedPreferences;
  List CODEN = [] ;
  List data = List();

  var status;
  var state_id;
  var city_id ;
  var address1;
  var address2;
  var vehicle_id;
  var OrderAmount;
  var walletamount;
  var couponAmount;


  TotalAmount()async{
    var finalamount = await OrderAmount - walletamount*couponAmount/100;
    return finalamount;

  }



  _Couponcode() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+token};
    final body = {
      "code":widget.code,
    };

    var data =  await http.post("http://shineurcar.com/api/verify-coupon", headers:header,body: body);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){

      couponAmount =jsondata['data']['discount'];

    }
    );
  }



  Getaddress() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+token};

    var data =  await http.get("http://shineurcar.com/api/get-address", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){

      vehicle_id =jsondata['data']['id'];

    }
    );
  }

  Getvehicledetails() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+token};

    var data =  await http.get("http://shineurcar.com/api/vehicles-type", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){
      OrderAmount =jsondata['data']['Prices'][0]['price'];
    }
    );
  }

  GetOrderAmount() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+token};

    var data =  await http.get("http://shineurcar.com/api/service-list", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){


    }
    );
  }

  WalletAmount() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+token};

    var data =  await http.get("http://shineurcar.com/api/service-list", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){
      walletamount= jsondata['data'];

    }
    );
  }




  placeorder() async{

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final response = await  http.post("http://shineurcar.com/api/place-order",
        headers: {
          'Accept':'application/json',
          'authorization' : 'Bearer '+token,
        },
        body: {
          "address_1" : address1,
          "address_2": address2,
          "state_id" :state_id,
          "city_id" : city_id,
          "vical type id" : vehicle_id,
          "order amount" : OrderAmount,
          "wallet amount" : walletamount,
          "total amount" : TotalAmount(),
        }

    ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);
    print(data);


  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Couponcode();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
