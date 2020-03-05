import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';



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
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
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



