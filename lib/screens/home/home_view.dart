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
                    return ListTile(
                      title: Text(card.name),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
