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

  SharedPreferences sharedPreferences ;

  var status ;
  var cityId;
  var stateId;
  List citylist = [];
  String _mySelection;
  var latitude;
  var longitude;
  List data = List();

  var cityid;
  var stateid;







  Future<String> CityListDetails() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    var res = await http.get("http://shineurcar.com/api/city-list" ,headers: {"Accept": "application/json",'authorization' : 'Bearer '+token},);
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody['data'];
    });


    print(resBody);

    return "Sucess";
  }
  Future<String> StateListDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    var res = await http.get("http://shineurcar.com/api/State-list" ,headers: {"Accept": "application/json",'authorization' : 'Bearer '+token},);
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody['data'];
      cityid = resBody['data']['id'];
      stateid = resBody['data']['id'];

    });

    print(resBody);

    return "Sucess";
  }


  addUserAddress(String address1, String address2,) async{

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    final response = await  http.post("$serverUrl/add-address",
        headers: {
          'Accept':'application/json',
          'authorization' : 'Bearer '+token,
        },
        body: {
          "address_1" : "$address1",
          "address_2": "$address2",
          "city_id" :  cityid,
          "State_id" : stateid,
          "latitude" : latitude,
          "longitude": longitude,
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




  final TextEditingController _address1Controller =  TextEditingController();
  final TextEditingController _address2Controller =  TextEditingController();


  _onPressed(){
    if(_address1Controller.text.isNotEmpty && _address2Controller.text.isNotEmpty){
      addUserAddress(_address1Controller.text,_address2Controller.text).whenComplete((){
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
    CityListDetails();
    StateListDetails();
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
                            'Add Address',
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
                      Container(
                        margin: EdgeInsets.all(10),
                        child: new DropdownButton(
                          hint: Text('City'),
                          items: data.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item["city_name"]),
                              value: item["id"].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _mySelection = newVal;
                            });
                          },
                          value: _mySelection,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: new DropdownButton(
                          hint: Text('State'),
                          items: data.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(item["State_name"]),
                              value: item["id"].toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _mySelection = newVal;
                            });
                          },
                          value: _mySelection,
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


