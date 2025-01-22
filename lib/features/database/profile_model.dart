class ProfileModel {
  final int? id;
  final String username;
  final String name;

  ProfileModel({
    required this.id,
    required this.username,
    required this.name
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'name': name};
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      username: map['username'],
      name: map['name'],
    );
  }
}