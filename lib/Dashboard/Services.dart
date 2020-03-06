import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarServices extends StatefulWidget {
  @override
  _CarServicesState createState() => _CarServicesState();

}

class _CarServicesState extends State<CarServices> {

  String id ="";
  String service_name ="";
  String price = "";
  String description = "";
  String service_term = "";
  String service_type = "";
  String service_status= "";

   List  Services = [] ;

  _servicedetails () async {

    final header = {'Accept':'application/json', 'authorization' : 'Bearer '+'13aQo5mKwQJUTTrUS9BnCbd5g'};

    var data =  await http.get("http://shineurcar.com/api/service-list", headers:header,);

    var jsondata = json.decode(data.body);

    print('Printing...');

    print(jsondata);

    setState((){
      Services = jsondata["data"];
    }
    );
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _servicedetails();
  }


  @override

  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: Center(child: Text('Services',style: TextStyle(color: Colors.purple),),),
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
      body: ListView.builder(
        itemCount: Services.length,
        itemBuilder: (BuildContext context ,int index)
        {
          return Container(
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
            child:Card(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Services[index]["info"]["service_name"].toString(),style:TextStyle(color: Colors.blue,fontSize: 25),),
                    Text(Services[index]["info"]["description"].toString().trim(),style:TextStyle(color: Colors.blue,fontSize: 25),),
                    Text(Services[index]["prices"][0]["price"].toString(),style:TextStyle(color: Colors.deepOrange,fontSize: 25),),
                  ],
                ),
              ),
            ));
          },
      )
    );
  }
}


