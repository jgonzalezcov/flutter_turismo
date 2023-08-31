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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 45, 125, 216),
                Color.fromARGB(248, 27, 147, 16),
                Color.fromARGB(252, 228, 214, 50),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
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
          child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.98, // Esto ajustará el ancho al 90% de la pantalla
          child: ListView(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                myCard.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'LobsterTwo',
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Hero(
                tag: myCard.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 4.0,
                      ),
                    ),
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
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.green,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    myCard.descriptionFull,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.green,
                      fontFamily: 'LobsterTwo',
                      fontSize: 15.8,
                    ),
                  ),
                )),
            PlaceMap(markers: markers)
          ]),
        ),
      )),
    );
  }
}
