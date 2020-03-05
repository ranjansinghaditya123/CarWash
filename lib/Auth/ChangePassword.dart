import 'package:car_wash/Api.dart';
import 'package:car_wash/Dashboard/Umap.dart';
import 'package:flutter/material.dart';
import 'package:car_wash/Auth/LogIn.dart';


class ChangePassword extends StatefulWidget{

  ChangePassword({Key key , this.title}) : super(key : key);
  final String title;


  @override

  _ChangePasswordState createState() => _ChangePasswordState();

}

class _ChangePasswordState extends State<ChangePassword>{

  Api api = new Api();
  String msgStatus = '';

  final TextEditingController _oldPasswordController = new TextEditingController();
  final  TextEditingController _newPasswordController = new TextEditingController();

  _onPressed() async{
    if (_oldPasswordController.text.trim().isNotEmpty &&
        _newPasswordController.text.trim().toLowerCase().isNotEmpty)
    {api.changePassword(_oldPasswordController.text.trim(),_newPasswordController.text.trim().toLowerCase()).whenComplete(() {
      if (api.status){
        _showDialog();
        msgStatus = 'Check email or password';
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Umap(),
        ));
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
      backgroundColor:Colors.amber[200],
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
                      height: 60,
                      width: double.infinity,
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/forget.png'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                      width: double.infinity,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Change Your Password',
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
                          'Enter your current password'
                              ' reset instruction',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Old Password',
                          helperStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.pink)),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16,0, 16,10),
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'New Password',
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
                          color: Colors.amber[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          )),
                      child: FlatButton(
                        onPressed:_onPressed,
                        child: Text(
                          'Change Password',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          )),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LogIn()));
                        },
                        child: Text(
                          'Back to sign in',
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
