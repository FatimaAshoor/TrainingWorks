import 'package:training_works/db/sql_db.dart';

class ShoppingCartService{
  SqlDb _sqlDb = SqlDb();

  Future<List<Map>> showProducts() async {
    List<Map> response = await _sqlDb.readData("SELECT * FROM products;");
    return response;
  }

  Future<List<Map>> addProductToCart(var proId) async {
    List<Map> response = await _sqlDb.updateData("INSERT INTO cart (productID) VALUES ($proId)");
    return response;
  }

  Future<int> addNewProduct(String name, String description, double price) async {
    int response = await _sqlDb.insertData("INSERT INTO products (name, description, price) VALUES ('${name}', '${description}', '${price}')");
    return response;
  }

  // ----------- Cart Methods
  Future<List<Map>> showCartProducts() async {
    List<Map> response = await _sqlDb.readData("SELECT * FROM products AS P JOIN cart AS C WHERE P.id = C.productID");
    return response;
  }

  Future<List<Map>> removeFromCart(var id) async {
    List<Map> response = await _sqlDb.deleteData("DELETE FROM cart WHERE productID = $id;");
    return response;
  }

  Future<int> clearCart() async {
    int response = await _sqlDb.deleteData("DELETE FROM cart;");
    return response;
  }

  Future totalCount() async {
    List<Map> response = await _sqlDb.readData("SELECT SUM(price) AS price FROM products AS p JOIN cart AS c WHERE p.id = c.productID");
    var res = response.first["price"];
    return res;
  }
}