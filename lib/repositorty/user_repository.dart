import 'package:dio/dio.dart';
import 'package:flutter_application_1/features/database/profile_model.dart';



class UserRepository {
  final Dio dio;
  final String url = 'http://192.168.0.11:8080/auth';
  //192.168.0.13
  //172.20.10.3

  UserRepository({required this.dio});

  Future<ProfileModel> getLoginUser(String username, String password) async {
    var data = '{"username": "$username", "password": "$password"}';
    final response = await Dio().get('$url/login', data: data);
    if (response.statusCode == 200) {
      ProfileModel profileModel = ProfileModel.fromMap(response.data);
      return profileModel;
    } else if (response.statusCode == 400) {
      return ProfileModel(id: 0, username: '', name: '');
    } else {
      return ProfileModel(id: 0, username: '', name: '');
    }
  }

  Future<void> registerUser(String name, String username, String password) async {
    var data = '{"name": "$name", "username": "$username", "password": "$password"}';
    print(data);
    await Dio().post('$url/register', data: data);
  }
}