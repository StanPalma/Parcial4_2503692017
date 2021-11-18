import 'package:flutter/material.dart';
import 'package:flutter_parcial4/app/ui/pages/home/home_controller.dart';
import 'package:flutter_parcial4/app/ui/pages/home/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition = const CameraPosition(
    target: LatLng(13.99417, -89.55972),
    zoom: 11,
  );

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    // mapStyle para usar Snazzy map
    controller.setMapStyle(mapStyle);
    setState(
      () {
        _markers.add(
          Marker(
            markerId: const MarkerId('id-1'),
            position: const LatLng(13.989520, -89.680624),
            infoWindow: const InfoWindow(
              title: 'Domicilios SV',
              snippet: 'Chalchuapa',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
          ),
        );
        _markers.add(
          Marker(
            markerId: const MarkerId('id-2'),
            position: const LatLng(13.903388, -89.500522),
            infoWindow: const InfoWindow(
              title: 'Domicilios SV',
              snippet: 'El Congo',
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcial 4'),
        backgroundColor: Colors.orange,
      ),
      body: GoogleMap(
        //onMapCreated: _controller.onMapCreated,
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.normal,
      ),
    );
  }
}
