import '../models/category.dart';
import '../database.dart';

class CategoryRepository {
  final db = DatabaseService.instance.db;

  void create(Category category) {
    db.execute('''
      INSERT INTO categories (category_name)
      VALUES (?)
    ''', [category.name]);
  }

  List<Category> getAll() {
    final result = db.select('SELECT * FROM categories');
    return result.map((row) => Category.fromMap(row)).toList();
  }

  void update(Category category) {
    db.execute('''
      UPDATE categories
      SET category_name = ?
      WHERE category_id = ?
    ''', [category.name, category.id]);
  }

  void delete(int id) {
    db.execute('DELETE FROM categories WHERE category_id = ?', [id]);
  }
  bool exists(int id) {
  final result = db.select('SELECT 1 FROM categories WHERE category_id = ?', [id]);
  return result.isNotEmpty;
}
}