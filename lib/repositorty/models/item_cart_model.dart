class ItemCartModel {
  final int id;
  final String name;
  final String imageName;
  final int cost;
  final int count;

  ItemCartModel({required this.id, required this.name, required this.imageName, required this.cost, required this.count});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'imageName': imageName, 'cost': cost, 'count': count};
  }

  factory ItemCartModel.fromMap(Map<String, dynamic> map) {
    return ItemCartModel(
      id: map['id'],
      name: map['name'],
      imageName: map['imageName'],
      cost: map['cost'],
      count: map['count']
    );
  }
}