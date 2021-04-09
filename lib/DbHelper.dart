import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Model/CartLocalModel.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;
  Future<Database> createDatabase() async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(path,version: 1, onCreate: (Database db, int v){
      //create tables
      db.execute("CREATE TABLE product ("
          "id TEXT PRIMARY KEY,"
          "name TEXT,"
          "img TEXT,"
          "description TEXT,"
          "price REAL,"
          "totalPrice REAL,"
          "quantity INTEGER"
          ")");

    });
    return _db;
  }
  Future<int> addToCart(CartMedelLocal cartMedelLocal ) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses value')
    return db.insert('product', cartMedelLocal.toMap());
  }
  Future<List> allProduct() async{
    Database db = await createDatabase();
    //db.rawQuery('select * from courses');
    return db.query('product');
  }
  Future<int> deleteCart() async{
    Database db = await createDatabase();
    return db.delete('product');
  }
  Future<int> delete(String id) async{
    Database db = await createDatabase();
    return db.delete('product', where: 'id = ?', whereArgs: [id]);
  }
  Future<int> updateCourse(CartMedelLocal product) async{
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    Database db = await createDatabase();
    return await db.update('product', product.toMap(),where: 'id = ?', whereArgs: [product.id]);
  }
  /////////////////////////////////

}