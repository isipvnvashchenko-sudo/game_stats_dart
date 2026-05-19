import 'package:sqlite3/sqlite3.dart';

class DatabaseService {
  static final DatabaseService instance =
      DatabaseService._init();

  late final Database db;

  DatabaseService._init() {
    db = sqlite3.open('pet_shop.db');

    createTables();
  }

  void createTables() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS categories (
        category_id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_name TEXT NOT NULL
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS products (
        product_id INTEGER PRIMARY KEY AUTOINCREMENT,
        product_name TEXT NOT NULL,
        price REAL NOT NULL,
        stock INTEGER NOT NULL,
        category_id INTEGER,
        FOREIGN KEY(category_id)
        REFERENCES categories(category_id)
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS customers (
        customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        phone TEXT,
        email TEXT
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS orders (
        order_id INTEGER PRIMARY KEY AUTOINCREMENT,
        customer_id INTEGER,
        order_date TEXT NOT NULL,
        FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS order_items (
        order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
        order_id INTEGER,
        product_id INTEGER,
        quantity INTEGER NOT NULL,
        FOREIGN KEY(order_id)
        REFERENCES orders(order_id),
        FOREIGN KEY(product_id)
        REFERENCES products(product_id)
      );
    ''');
  }
}