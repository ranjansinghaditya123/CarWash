import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_wash/Dashboard/Orders.dart';
import 'package:car_wash/Dashboard/CarServices.dart';
import 'package:car_wash/Dashboard/UserProfile.dart';



class Umap extends StatefulWidget {

  Umap({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UmapState createState() => _UmapState();
}

class _UmapState extends State<Umap> {
  int _counter = 0;

  String apiKey = "AIzaSyCUJkTBn8cY_E5j3tP6jjcZugZA0056KDQ";
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.520445, 87.311920),
    zoom: 14.4746,
  );

  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final String polylineIdVal = 'polyline_id_1';

    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.orange,
      width: 5,
      points: _createPoints(),
      onTap: () {

      },
    );

    setState(() {
      polylines[polylineId] = polyline;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()),
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
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.6,
            child: Positioned(
              top: 50,
              bottom: 50,
              right: 50,
              left: 50,
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CarServices()),
                    );
                  },
                    child: Text("Book Now".toUpperCase(), style: TextStyle(fontSize: 18.0),),
                    color: Colors.red,
                    padding: EdgeInsets.all(12.0),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0))
                ),
              ),
            ),
          ),
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            polylines: Set<Polyline>.of(polylines.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<LatLng> _createPoints() {

    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(23.546961,87.296976));
    points.add(_createLatLng(23.682749,87.169006));
    return points;

  }

  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);

  }

}



