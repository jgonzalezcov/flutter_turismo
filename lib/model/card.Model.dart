// ignore_for_file: prefer_initializing_formals

class MyCard {
  late int id;
  late String name;
  late String url;
  late String descriptionShort;

  MyCard(int id, String name, String url, String descriptionShort) {
    this.id = id;
    this.name = name;
    this.url = url;
    this.descriptionShort = descriptionShort;
  }
}
