import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();

}

class _ServicesState extends State<Services> {

  @override

  Widget build(BuildContext context){


    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Center(child: Text('Services'),),
        backgroundColor: Colors.amber,),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child:  Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                  child: Icon(Icons.map,color: Colors.purple,size:35,)
              ),
            ),
            Expanded(
              child: FlatButton(
                child: Icon(Icons.history,color: Colors.purple,size:35,),
              ),
            ),
            Expanded(
              child: FlatButton(
                  child:Icon(Icons.add_shopping_cart,color: Colors.purple,size:35,)
              ),
            ),
            Expanded(
              child: FlatButton(
                  child: Icon(Icons.account_circle,color: Colors.purple,size:35,)
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
                  title: Text("Bronze Car Wash Package",style: TextStyle(color: Colors.black,fontSize: 20),),
                  subtitle: Text("10\$",style: TextStyle(color: Colors.red,fontSize: 15),),
                  leading: Icon(Icons.local_car_wash,color: Colors.orangeAccent,size: 50,),

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
                  title: Text("Silver Car Wash Package",style: TextStyle(color: Colors.black,fontSize: 20),),
                  subtitle: Text("20\$",style: TextStyle(color: Colors.red,fontSize: 15),),
                  leading: Icon(Icons.local_car_wash,color: Colors.orangeAccent,size: 50,),

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
                  title: Text("Gold Car Wash Package",style: TextStyle(color: Colors.black,fontSize: 20),),
                  subtitle: Text("30\$",style: TextStyle(color: Colors.red,fontSize: 15),),
                  leading: Icon(Icons.local_car_wash,color: Colors.orangeAccent,size: 50,),

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
                  title: Text("Platinum Car Wash Package",style: TextStyle(color: Colors.black,fontSize: 20),),
                  subtitle: Text("40\$",style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
                 leading: Icon(Icons.local_car_wash,color: Colors.orangeAccent,size: 50,),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
