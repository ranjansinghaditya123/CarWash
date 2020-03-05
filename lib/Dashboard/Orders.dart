import 'package:flutter/material.dart';


class Orders extends StatefulWidget{

  @override
  _OrdersState createState() => _OrdersState();

}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context){

    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          title: Center(child: Text('Orders'),),
          backgroundColor: Colors.amber,),
        bottomNavigationBar: BottomAppBar(
          color: Colors.amber,
          child: Row(
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
        )
    );
  }
}
