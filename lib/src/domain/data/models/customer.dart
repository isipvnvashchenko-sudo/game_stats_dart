class Customer {
  int? id;
  String firstName;
  String lastName;
  String phone;
  String email;

  Customer({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  Map<String, Object?> toMap() {
    return {
      'customer_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
    };
  }

  factory Customer.fromMap(Map<String, Object?> map) {
    return Customer(
      id: map['customer_id'] as int?,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }
}