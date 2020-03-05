
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Api{

  String serverUrl = "http://shineurcar.com/api";

  var status ;
  var token ;

  signIn(String mobile , String password) async{

    String myUrl = "$serverUrl/sign-in";
    final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "mobile": "$mobile",
          "password" : "$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    print(data);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  signUp(String name ,String mobile , String password, ) async{

    final response = await  http.post("$serverUrl/sign-up",
        headers: {
          'Accept':'application/json'
        },
        body: {
          "mobile": "$name",
          "name": "$mobile",
          "password" : "$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  forgotPassword(String mobile,) async{

    final response = await  http.post("$serverUrl/forgot-password",
        headers: {

          'Accept':'application/json'

        },
        body: {
          "mobile": "$mobile",
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);
    print(data);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  changePassword(String currentPassword, String newPassword) async{

    final response = await  http.post("$serverUrl/change-password",
        headers: {
          'Accept':'application/json'
        },
        body: {

           "current_password" : "$currentPassword",
          "new_password" : "$newPassword",

        }
        ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);
    print(data);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }

  }

  updateUserProfile(String name) async{

    final response = await  http.post("$serverUrl/change-password",
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name" : "$name",
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

  updateUserAddress(String address1, String address2, String cityId, String stateId, String latitude, String longitude  ) async{

    final response = await  http.post("$serverUrl/change-password",
        headers: {
          'Accept':'application/json'
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

  addUserAddress(String address1, String address2, String cityId, String stateId, String latitude, String longitude  ) async{

    final response = await  http.post("$serverUrl/change-password",
        headers: {
          'Accept':'application/json'
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


//  editsingerprofile(String name, String about, String address, String city, String state, String mobileNumber, String musicCategory)async{
//
//    String myUrl = "https://www.laravel.gowebbidemo.com/121891/public/api/singer/profile";
//
//    final response = await  http.post(myUrl,
//        headers: {
//
//          'Accept':'application/json',
//          'authorization' : 'Bearer '+'L0Oe74WSRc768mvfbNQjR6rml',
//
//        },
//        body: {
//
//          "name": "$name",
//          "about" : "$about",
//          "address 1": "$address",
//          "city" : "$city",
//          "state" : "$state",
//          "mobile number" : "$mobileNumber",
//          "music category" : "$musicCategory",
//
//        }
//
//        ) ;
//    status = response.body.contains('error');
//
//    var data = json.decode(response.body);
//
//    print(data);
//
////    if(status){
////      print('data : ${data["error"]}');
////    }else{
////      print('data : ${data["token"]}');
////      _save(data["token"]);
////    }
//
//  }


//  editOrganizerProfile(String name, String about, String address , String city, String state, String mobileNumber, String eventCategory )async{
//
//    String Myurl = "https://www.laravel.gowebbidemo.com/121891/public/api/organizer/profile";
//    final response = await http.post(Myurl,
//       headers:  {
//
//         'Accept':'application/json',
//         'authorization' : 'Bearer '+'L0Oe74WSRc768mvfbNQjR6rml',
//
//       },
//      body: {
//      "name" : "$name",
//        "about" : "$about",
//        "address 1" : "$address",
//        "city" : "$city",
//        "state" : "$state",
//        "mobileNumber" : "$mobileNumber",
//        "event" : "$eventCategory"
//      },
//    );
//
//    status = response.body.contains('error');
//    var data = jsonDecode(response.body);
//
//    if(status){
//      print('data : ${data["error"]}');
//    }else{
//      print('data : ${data["token"]}');
//      _save(data["token"]);
//    }
//
//  }

//  editUserProfile(String name , String email, String userName)async{
//
//    String Myurl = "https://www.laravel.gowebbidemo.com/121891/public/api/user/profile";
//
//    final response = await http.post(Myurl,
//
//      headers: {
//        'Accept':'application/json',
//        'authorization' : 'Bearer '+'L0Oe74WSRc768mvfbNQjR6rml',
//      },
//
//      body: {
//
//      "name" : "$name",
//        "email" : "$email",
//        "password" : "$userName",
//
//      },
//    );
//
//    status = response.body.contains('error');
//    var data = jsonDecode(response.body);
//
//    if(status){
//      print('data : ${data["error"]}');
//    }else{
//      print('data : ${data["token"]}');
//      _save(data["token"]);
//    }
//  }

  _save(String token,) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
    prefs.setString('token', token);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }






}