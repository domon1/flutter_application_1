class ItemListModel {
  final int id;
  final String name;
  final String imageName;
  final int cost;

  ItemListModel({required this.id, required this.name, required this.imageName, required this.cost});

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    return ItemListModel(id: json['id'], name: json['name'], imageName: json['imageName'], cost: json['cost']);
  }
}