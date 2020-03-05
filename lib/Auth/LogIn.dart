import 'package:car_wash/Api.dart';
import 'package:car_wash/Dashboard/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget{

  LogIn({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    if(value != '0'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),
      );
    }
  }

  @override
  initState(){
    read();
  }


  Api api = new Api();

  String msgStatus = '';


  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();



  _onPressed() {
    if (_mobileController.text.trim().toLowerCase().isNotEmpty && _passwordController.text.trim().isNotEmpty)
    {api.signIn(_mobileController.text.trim().toLowerCase(),
        _passwordController.text.trim()).whenComplete(() {
      if (api.status) {
        _showDialog();
        msgStatus = 'Check email or password';
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),
        );
      }
    });
    }
    setState(() {
    });
  }

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(

                child: new Text(
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amber[200],
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: 780,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(7),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'images/logo.jpg',
                              )),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Welcome Back',
                            style: TextStyle(fontSize: 40, color: Colors.black),
                          ),
                          Text(
                            'Sign in to continue',
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _mobileController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
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
                          controller: _passwordController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            helperStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.pink)),
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      Container(
                        child: FlatButton(
                          child: Text(
                            'ForgetPassword?',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
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
                          onPressed:_onPressed,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'I\'m the new user.',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Container(
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.amber[200]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
