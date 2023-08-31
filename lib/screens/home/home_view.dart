import 'package:flutter/material.dart';
import 'package:tourist/helpers/packages.dart';
import 'package:tourist/screens/home/home_viewmodel.dart';
import 'package:tourist/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 120,
                child: HeaderWidget(
                    textHeader: 'Turismo Chile', heightHeader: 120),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: ViewModelBuilder<HomeViewModel>.reactive(
                  viewModelBuilder: () => HomeViewModel(),
                  onViewModelReady: (model) async {
                    await model.getCard();
                  },
                  builder: (context, model, child) => Column(
                    children: [
                      const SizedBox(height: 93),
                      if (model.listCard.isNotEmpty)
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.listCard.length,
                            itemBuilder: (context, index) {
                              final card = model.listCard[index];
                              return Hero(
                                tag: card.id,
                                child: CardWidget(cardData: card),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 107,
                child: Padding(
                  padding: const EdgeInsets.only(top: 93, left: 4, right: 3),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(172, 182, 236, 153),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
