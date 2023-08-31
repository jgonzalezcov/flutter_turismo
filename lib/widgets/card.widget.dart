import 'package:flutter/material.dart';
import 'package:tourist/model/card.model.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.cardData}) : super(key: key);
  final MyCard cardData;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('detailplace', arguments: widget.cardData);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: widget.cardData.id == 1
                ? const EdgeInsets.fromLTRB(5, 40, 5, 5)
                : const EdgeInsets.all(5),
            width: 150,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.green,
                width: 3.0,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                    child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(11),
                  ),
                  child: FadeInImage(
                    filterQuality: FilterQuality.low,
                    fadeInCurve: Curves.linear,
                    width: 150,
                    height: 220,
                    placeholder: const AssetImage('assets/imgs/fondo7.gif'),
                    image: NetworkImage(
                      'https://backednodeflutter-production.up.railway.app/${widget.cardData.url}',
                    ),
                    fit: BoxFit.cover,
                  ),
                )),
                Container(
                  width: 380,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/imgs/fondo_viajes.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
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
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 22),
                  width: 180,
                  child: Text(
                    widget.cardData.descriptionShort,
                    style: const TextStyle(
                      fontFamily: 'YsabeauOffice',
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
