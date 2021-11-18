import 'package:flutter/material.dart';
import 'package:flutter_parcial4/app/ui/pages/home/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition = const CameraPosition(
    target: LatLng(13.714011, -89.215264),
    zoom: 12,
  );
  // Para agregar Snazzy map
  final _controller = HomeController();

  final Map<MarkerId, Marker> _makers = Map();
  _onTap(LatLng position) {
    final markerId = MarkerId(_makers.length.toString());
    final maker = Marker(markerId: markerId, position: position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcial 4'),
        backgroundColor: Colors.orange,
      ),
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        markers: Set.of(_makers.values),
        onTap: _onTap,
        compassEnabled: false,
      ),

      // Despues de modificar painter.dart
      /* customPain: CustomPaint(
          painter: Painter(),
        ), */
    );
  }
}
