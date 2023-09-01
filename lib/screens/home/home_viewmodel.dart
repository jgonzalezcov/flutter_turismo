import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tourist/helpers/packages.dart';
import 'package:tourist/model/card.model.dart';

class HomeViewModel extends BaseViewModel {
  List<MyCard> _listCard = [];
  List<MyCard> get listCard => _listCard;

  Future<void> getCard() async {
    List<MyCard> listData = [];
    String url = dotenv.get("API_HOST", fallback: "");
    final response = await Client().get(Uri.parse(url));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData) {
        listData.add(MyCard(
          item["id"],
          item["name"],
          item["url"],
          item["description_short"],
          item["description_full"],
          (item['lat'] as num).toDouble(),
          (item['lon'] as num).toDouble(),
        ));
      }

      _listCard = listData;
      notifyListeners();
    } else {
      throw Exception("Fallo la conexión");
    }
  }
}
