import 'package:flutter_application_1/features/database/profile_model.dart';
import 'package:flutter_application_1/repositorty/models/item_cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider instance = DBProvider._instance();
  static Database? _database;

  DBProvider._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'geeksforgeeks.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profile (
        id INTEGER PRIMARY KEY,
        username TEXT,
        name TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE cart_item (
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageName TEXT,
        cost INTEGER,
        count INTEGER
      )
    ''');
  }

  // items

  Future<int> insertItem(ItemCartModel item) async {
    Database db = await instance.db;
    return await db.insert('cart_item', item.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllItems() async {
    Database db = await instance.db;
    return await db.query('cart_item');
  }

  Future<int> deleteItem(int id) async {
    Database db = await instance.db;
    return await db.delete('cart_item', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateItem(ItemCartModel newModel) async {
    Database db = await instance.db;
    return await db.update('cart_item', newModel.toMap(), where: 'id = ?', whereArgs: [newModel.id]);
  }

  Future<int> deleteAllItems() async {
    Database db = await instance.db;
    return await db.delete('cart_item');
  }

  // profile

  Future<int> insertUser(ProfileModel profile) async {
    Database db = await instance.db;
    return await db.insert('profile', profile.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    Database db = await instance.db;
    return await db.query('profile');
  }

  Future<int> deleteUser() async {
    Database db = await instance.db;
    return await db.delete('profile');
  }
}
