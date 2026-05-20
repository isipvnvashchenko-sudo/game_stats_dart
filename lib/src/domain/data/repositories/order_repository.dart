import '../models/order.dart';
import '../database.dart';

class OrderRepository {
  final db = DatabaseService.instance.db;

  void create(Order order) {
    db.execute('''
      INSERT INTO orders (customer_id, order_date)
      VALUES (?, ?)
    ''', [order.customerId, order.orderDate]);
  }

  List<Order> getAll() {
    final result = db.select('SELECT * FROM orders');
    return result.map((row) => Order.fromMap(row)).toList();
  }

  void update(Order order) {
    db.execute('''
      UPDATE orders
      SET customer_id = ?, order_date = ?
      WHERE order_id = ?
    ''', [order.customerId, order.orderDate, order.id]);
  }

  void delete(int id) {
    db.execute('DELETE FROM orders WHERE order_id = ?', [id]);
  }
  bool exists(int id) {
  final result = db.select('SELECT 1 FROM orders WHERE order_id = ?', [id]);
  return result.isNotEmpty;
}
Order? getById(int id) {
  final result = db.select('SELECT * FROM orders WHERE order_id = ?', [id]);
  if (result.isEmpty) return null;
  return Order.fromMap(result.first);
}
}