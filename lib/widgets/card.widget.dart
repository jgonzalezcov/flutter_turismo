import 'package:flutter/material.dart';
import 'package:tourist/model/card.Model.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.cardData}) : super(key: key);
  final MyCard cardData;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.cardData.id == 1
            ? const EdgeInsets.fromLTRB(5, 40, 5, 5)
            : const EdgeInsets.all(5),
        width: 150,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          image: DecorationImage(
            image: NetworkImage(
                'https://backednodeflutter-production.up.railway.app/${widget.cardData.url}'),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.green,
            width: 3.0,
          ),
        ),
        child: Stack(children: [
          Container(
              width: 380,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/imgs/fondo_viajes.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(11),
                        topRight: Radius.circular(11),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        widget.cardData.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 180,
                    child: Text(
                      widget.cardData.descriptionShort,
                      style: const TextStyle(
                          fontFamily: 'YsabeauOffice', color: Colors.green),
                    ),
                  )
                ],
              ))
        ]));
  }
}
