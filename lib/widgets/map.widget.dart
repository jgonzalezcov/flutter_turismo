import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PlaceMap extends StatefulWidget {
  const PlaceMap({
    Key? key, // Correct the use of key
    required this.markers,
    this.center = const LatLng(-33, -77),
  }) : super(key: key); // Use super with the appropriate constructor

  final List<Marker> markers;
  final LatLng center;

  @override
  State<PlaceMap> createState() => _PlaceMapState();
}

class _PlaceMapState extends State<PlaceMap> {
  @override
  Widget build(BuildContext context) {
    // Encontrar el primer marcador con posición en la lista de marcadores
    final centerMarker = widget.markers.firstWhere(
        (marker) => marker.point.latitude != 0 && marker.point.longitude != 0,
        orElse: () => Marker(
              point: widget.center,
              builder: (BuildContext context) => const Icon(Icons.location_pin),
              width: 30.0,
            ));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: FlutterMap(
            options: MapOptions(
              center: centerMarker.point,
              zoom: 4,
            ),
            nonRotatedChildren: const [],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: widget.markers),
            ],
          ),
        ),
      ),
    );
  }
}
