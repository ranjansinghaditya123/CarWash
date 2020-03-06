import 'package:car_wash/Api.dart';
import 'package:car_wash/Dashboard/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:car_wash/Dashboard/Umap.dart';

class LogIn extends StatefulWidget{

  LogIn({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    if(value != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>Umap()),
      );
    }
  }

  Api api = new Api();
  String msgStatus = '';

  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed() {
    if (_mobileController.text.trim().toLowerCase().isNotEmpty && _passwordController.text.trim().isNotEmpty) {
      api.signIn(_mobileController.text.trim().toLowerCase(), _passwordController.text.trim()).whenComplete(() {
      if (api.status) {
        _showDialog();
        msgStatus = 'Check email or password';
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Umap()),
        );
      }
    });
    }

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
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 100),
                    child: Image.asset('images/logo.png'),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: TextFormField(
                      controller: _mobileController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.mobile_screen_share),
                        hintText: 'Mobile Number',
                        helperStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.pink)
                        ),
                            contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        hintText: 'Password',
                        helperStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.pink)),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                        onPressed: _onPressed,
                        child: Text("Sign in".toUpperCase(), style: TextStyle(fontSize: 18.0),),
                        color: Colors.red,
                        padding: EdgeInsets.all(12.0),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0))
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    width: double.infinity,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                        onPressed: _onPressed,
                        child: Text("Sign Up".toUpperCase(), style: TextStyle(fontSize: 18.0),),
                        color: Colors.blue,
                        padding: EdgeInsets.all(12.0),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0))
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
