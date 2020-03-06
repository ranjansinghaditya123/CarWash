import 'package:car_wash/Api.dart';
import 'package:car_wash/Dashboard/Umap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {

  Register({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {

  Api api = new Api();


  String msgStatus = '';

  final TextEditingController _nameController =  TextEditingController();
  final TextEditingController _mobileController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();

  _onPressed() async{
    if (_nameController.text.trim().toLowerCase().isNotEmpty && _mobileController.text.trim().isNotEmpty &&
        _passwordController.text.trim().toLowerCase().isNotEmpty)
    {api.signUp(_nameController.text.trim().toLowerCase(),
        _mobileController.text.trim(),_passwordController.text.trim().toLowerCase()).whenComplete(() {
      if (api.status){
        _showDialog();
        msgStatus = 'Check email or password';
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Umap()),
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

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amber[200],
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
                            'Create Account',
                            style: TextStyle(fontSize: 40, color: Colors.black),
                          ),
                          Text(
                            'Sign up to continue',
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
                          controller: _nameController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Name',
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
                          controller: _mobileController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.phone,
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
                      SizedBox(
                        height: 45,
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
                          onPressed: _onPressed,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
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
                                  'SignIn',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.amber[200],
                                ),
                              ),
                            )
                            )],
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
