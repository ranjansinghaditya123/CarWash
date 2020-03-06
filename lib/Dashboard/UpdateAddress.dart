import 'package:car_wash/Api.dart';
import 'package:car_wash/Dashboard/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateAddress extends StatefulWidget{

  UpdateAddress({Key key , this.title}) : super(key : key);
  final String title;


  @override

  _UpdateAddressState createState() => _UpdateAddressState();

}

class _UpdateAddressState extends State<UpdateAddress>{

  String serverUrl = "http://shineurcar.com/api";
  var status ;
  var token ;

  updateUserAddress(String address1, String address2, String cityId, String stateId, String latitude, String longitude  ) async{

    final response = await  http.post("$serverUrl/update-address",
        headers: {
          'Accept':'application/json',
          'authorization' : 'Bearer '+'13aQo5mKwQJUTTrUS9BnCbd5g',
        },
        body: {
          "address_1" : "$address1",
          "address_2": "$address2",
          "city_id" : "$cityId",
          "State_id" : "$stateId",
          "latitude" : "$latitude",
          "longitude": "$longitude",

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

  Api api = new Api();
  String msgStatus = '';

  var cityId;
  var stateId;
  var latitude;
  var longitude;

  final TextEditingController _address1Controller =  TextEditingController();
  final TextEditingController _address2Controller =  TextEditingController();


  _onPressed(){
    if(_address1Controller.text.isNotEmpty && _address2Controller.text.isNotEmpty && cityId.isNotEmpty && stateId.isNotEmpty
        && latitude.isNotEmpty && longitude.isNotEmpty){
      updateUserAddress(_address1Controller.text, _address2Controller.text,cityId,stateId,latitude,longitude).whenComplete((){
        if(api.status){
          msgStatus = 'All Fields Are mandatory';
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserProfile()),
          );
        }
      });
    }
    setState((){
    });
  }

  _getCurrentLocation() async{

    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState((){
        latitude =position.latitude.toString();
        longitude = position.longitude.toString();
      });
    }).catchError((e) {
      print(e);
    });
  }



  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title:  Text('Failed'),
            content:   Text('All Fields Are Mandatory'),
            actions: <Widget>[
              RaisedButton(
                child:  Text(
                  'Close',
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffffFCC6E2),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: 750,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Text(
                            'Update Address',
                            style: TextStyle(fontSize: 40, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: double.infinity,
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextFormField(
                          controller:_address1Controller,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Address 1',
                            helperStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.pink)),
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _address2Controller,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Address 2',
                            helperStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.pink)),
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: double.infinity,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),),
                        child: FlatButton(
                          onPressed: _onPressed,
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}