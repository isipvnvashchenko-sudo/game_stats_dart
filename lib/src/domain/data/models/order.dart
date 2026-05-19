class Order {
  int? id;
  int customerId;
  String orderDate;

  Order({
    this.id,
    required this.customerId,
    required this.orderDate,
  });

  Map<String, Object?> toMap() {
    return {
      'order_id': id,
      'customer_id': customerId,
      'order_date': orderDate,
    };
  }

  factory Order.fromMap(Map<String, Object?> map) {
    return Order(
      id: map['order_id'] as int,
      customerId: map['customer_id'] as int,
      orderDate: map['order_date'] as String,
    );
  }
}