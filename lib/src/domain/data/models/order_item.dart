class OrderItem {
  int? id;
  int orderId;
  int productId;
  int quantity;

  OrderItem({
    this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
  });

  Map<String, Object?> toMap() {
    return {
      'order_item_id': id,
      'order_id': orderId,
      'product_id': productId,
      'quantity': quantity,
    };
  }

  factory OrderItem.fromMap(Map<String, Object?> map) {
    return OrderItem(
      id: map['order_item_id'] as int,
      orderId: map['order_id'] as int,
      productId: map['product_id'] as int,
      quantity: map['quantity'] as int,
    );
  }
}