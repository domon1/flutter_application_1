class ItemModel {
  final int id;
  final String name;
  final String description;
  final String imageName;
  final int cost;

  ItemModel({required this.id, required this.name, required this.imageName, required this.cost, required this.description});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(id: json['id'], name: json['name'], imageName: json['imageName'], cost: json['cost'], description: json['description']);
  }
}