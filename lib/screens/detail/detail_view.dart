import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:tourist/model/card.model.dart';
import 'package:tourist/widgets/map.widget.dart';
import 'package:latlong2/latlong.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final MyCard? myCard =
        ModalRoute.of(context)?.settings.arguments as MyCard?;

    if (myCard == null) {
      return const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('No se proporcionó ninguna tarjeta'),
          ),
        ),
      );
    }
    final markers = <Marker>[
      Marker(
        point: LatLng(myCard.lat, myCard.lon),
        builder: (context) => const Icon(Icons.location_pin),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Detalle',
            style: TextStyle(color: Colors.white),
          ),
          leading: const BackButton(color: Colors.white),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                'Volver a Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: ListView(children: [
          Hero(
            tag: myCard.id,
            child: FadeInImage(
              filterQuality: FilterQuality.low,
              fadeInCurve: Curves.linear,
              width: double.infinity,
              height: 220,
              placeholder: const AssetImage('assets/imgs/fondo7.gif'),
              image: NetworkImage(
                'https://backednodeflutter-production.up.railway.app/${myCard.url}',
              ),
              fit: BoxFit.cover,
            ),
          ),
          Text(myCard.descriptionFull),
          PlaceMap(markers: markers)
        ])));
  }
}
