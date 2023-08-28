import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tourist/screens/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) async {
        await model.getCard(); // Llama al método para obtener datos de la API
      },
      builder: (context, model, child) => Expanded(
        child: Column(
          children: [
            if (model.listCard.isNotEmpty)
              Expanded(
                child: ListView.builder(
                    itemCount: model.listCard.length,
                    itemBuilder: (context, index) {
                      final card = model.listCard[index];
                      return Container(
                          margin: const EdgeInsets.all(5),
                          width: 150,
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://backednodeflutter-production.up.railway.app/${card.url}'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Colors.blue, // Color del borde
                              width: 3.0, // Ancho del borde
                            ),
                          ),
                          child: Stack(children: [
                            Container(
                                width: 380,
                                height: 220,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/imgs/fondo_viajes.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          color: Colors.green),
                                      child: Text(
                                        card.name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      width: 180,
                                      child: Text(
                                        card.descriptionShort,
                                        style: const TextStyle(
                                            fontFamily: 'YsabeauOffice',
                                            color: Colors.green),
                                      ),
                                    )
                                  ],
                                ))
                          ]));
                    }),
              )
          ],
        ),
      ),
    );
  }
}
