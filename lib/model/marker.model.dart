import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Marker {
  final LatLng point;
  final Widget Function(BuildContext) builder;
  final double width;

  Marker({
    required this.point,
    required this.builder,
    required this.width,
  });
}
