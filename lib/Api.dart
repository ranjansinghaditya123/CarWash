import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Api{

  String serverUrl = "http://shineurcar.com/api";
 SharedPreferences sharedPreferences;
  var status ;


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
          "mobile": "$mobile",
          "name": "$name",
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

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final response = await  http.post("$serverUrl/change-password",
        headers: {
          'Accept':'application/json',
          'authorization' : 'Bearer '+token,
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

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final response = await  http.post("$serverUrl",
        headers: {
          'Accept':'application/json',
          'authorization' : 'Bearer '+token,
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