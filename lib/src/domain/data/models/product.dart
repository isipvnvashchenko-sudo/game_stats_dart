class Product {
  int? id;
  String name;
  double price;
  int stock;
  int categoryId;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.categoryId,
  });

  Map<String, Object?> toMap() {
    return {
      'product_id': id,
      'product_name': name,
      'price': price,
      'stock': stock,
      'category_id': categoryId,
    };
  }

  factory Product.fromMap(Map<String, Object?> map) {
    return Product(
      id: map['product_id'] as int,
      name: map['product_name'] as String,
      price: map['price'] as double,
      stock: map['stock'] as int,
      categoryId: map['category_id'] as int,
    );
  }
}