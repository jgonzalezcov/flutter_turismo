import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:tourist/model/card.Model.dart';
import 'dart:convert';

class HomeViewModel extends BaseViewModel {
  List<MyCard> _listCard = [];
  List<MyCard> get listCard => _listCard;
  Future<void> getCard() async {
    List<MyCard> listData = [];
    final response = await http.get(Uri.parse(
        'https://backednodeflutter-production.up.railway.app/tourist'));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData) {
        listData.add(MyCard(
            item["id"], item["name"], item["url"], item["description_short"]));
      }

      _listCard = listData;
      notifyListeners();
    } else {
      throw Exception("Fallo la conexión");
    }
  }
}
