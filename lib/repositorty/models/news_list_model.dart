class NewsListModel {
  final int id;
  final String name;
  final String imageName;
  // TODO mb add data?

  NewsListModel({required this.id, required this.name, required this.imageName}); 

  factory NewsListModel.fromJson(Map<String, dynamic> json) {
    return NewsListModel(id: json['id'], name: json['name'], imageName: json['imageName']);
  }
}