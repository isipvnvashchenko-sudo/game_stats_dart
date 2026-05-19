import '../models/product.dart';
import '../database.dart';

class ProductRepository {
  final db = DatabaseService.instance.db;

  void create(Product product) {
    db.execute('''
      INSERT INTO products (
        product_name,
        price,
        stock,
        category_id
      )
      VALUES (?, ?, ?, ?)
    ''', [
      product.name,
      product.price,
      product.stock,
      product.categoryId
    ]);
  }

  List<Product> getAll() {
    final result =
        db.select('SELECT * FROM products');

    return result.map((row) {
      return Product.fromMap(row);
    }).toList();
  }

  void update(Product product) {
    db.execute('''
      UPDATE products
      SET
        product_name = ?,
        price = ?,
        stock = ?
      WHERE product_id = ?
    ''', [
      product.name,
      product.price,
      product.stock,
      product.id
    ]);
  }

  void delete(int id) {
    db.execute('''
      DELETE FROM products
      WHERE product_id = ?
    ''', [id]);
  }
  bool exists(int id) {
  final result = db.select('SELECT 1 FROM products WHERE product_id = ?', [id]);
  return result.isNotEmpty;
}
}