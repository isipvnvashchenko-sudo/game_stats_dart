import '../models/customer.dart';
import '../database.dart';

class CustomerRepository {
  final db = DatabaseService.instance.db;

  void create(Customer customer) {
    db.execute('''
      INSERT INTO customers (first_name, last_name, phone, email)
      VALUES (?, ?, ?, ?)
    ''', [customer.firstName, customer.lastName, customer.phone, customer.email]);
  }

  List<Customer> getAll() {
    final result = db.select('SELECT * FROM customers');
    return result.map((row) => Customer.fromMap(row)).toList();
  }

  void update(Customer customer) {
    db.execute('''
      UPDATE customers
      SET first_name = ?, last_name = ?, phone = ?, email = ?
      WHERE customer_id = ?
    ''', [customer.firstName, customer.lastName, customer.phone, customer.email, customer.id]);
  }

  void delete(int id) {
    db.execute('DELETE FROM customers WHERE customer_id = ?', [id]);
  }
  bool exists(int id) {
  final result = db.select('SELECT 1 FROM customers WHERE customer_id = ?', [id]);
  return result.isNotEmpty;
}
Customer? getById(int id) {
  final result = db.select('SELECT * FROM customers WHERE customer_id = ?', [id]);
  if (result.isEmpty) return null;
  return Customer.fromMap(result.first);
}
}
