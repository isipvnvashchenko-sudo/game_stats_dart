import '../models/order_item.dart';
import '../database.dart';

class OrderItemRepository {
  final db = DatabaseService.instance.db;

  void create(OrderItem orderItem) {
    db.execute('''
      INSERT INTO order_items (order_id, product_id, quantity)
      VALUES (?, ?, ?)
    ''', [orderItem.orderId, orderItem.productId, orderItem.quantity]);
  }

  List<OrderItem> getAll() {
    final result = db.select('SELECT * FROM order_items');
    return result.map((row) => OrderItem.fromMap(row)).toList();
  }

  void update(OrderItem orderItem) {
    db.execute('''
      UPDATE order_items
      SET order_id = ?, product_id = ?, quantity = ?
      WHERE order_item_id = ?
    ''', [orderItem.orderId, orderItem.productId, orderItem.quantity, orderItem.id]);
  }

  void delete(int id) {
    db.execute('DELETE FROM order_items WHERE order_item_id = ?', [id]);
  }
}