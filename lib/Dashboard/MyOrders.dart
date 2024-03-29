import 'package:flutter/material.dart';
import 'package:car_wash/Dashboard/CarServices.dart';
import 'package:car_wash/Dashboard/Umap.dart';
import 'package:car_wash/Dashboard/UserProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class MyOrders extends StatefulWidget{

  @override
  _MyOrdersState createState() => _MyOrdersState();

}

class _MyOrdersState extends State<MyOrders> {

SharedPreferences sharedPreferences;

List OrderList = [];


  _MyOrder() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+token};


    var data =  await http.get("http://shineurcar.com/api/my-order", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){

      OrderList = jsondata['data'];
    }
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _MyOrder();
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          title: Center(child: Text('Orders',style: TextStyle(color: Colors.purple),),),
          backgroundColor: Colors.amber,),
        bottomNavigationBar: BottomAppBar(

          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Umap()),
                    );
                  },
                  child: Icon(Icons.location_searching,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CarServices()),
                    );
                  },
                  child: Icon(Icons.add_shopping_cart,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()),
                    );
                  },
                  child: Icon(Icons.history,color: Colors.purple,),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),
                    );
                  },
                  child: Icon(Icons.account_circle,color: Colors.purple,),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Text('Order#:445202',style: TextStyle(fontSize: 20),),
                    subtitle: Text('11-Dec-2019',style: TextStyle(fontSize: 12),),
                    leading:  Icon(Icons.check,color: Colors.green,size:50,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Text('Order#:445202',style: TextStyle(fontSize: 20),),
                    subtitle: Text('11-Dec-209',style: TextStyle(fontSize: 12),),
                    leading:  Icon(Icons.cancel,color: Colors.red,size:50,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Text('Order#:445202',style: TextStyle(fontSize: 20),),
                    subtitle: Text('11-Dec-2019',style: TextStyle(fontSize: 12),),
                    leading:  Icon(Icons.check,color: Colors.green,size:50,),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
