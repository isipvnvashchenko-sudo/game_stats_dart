class Category {
  int? id;
  String name;

  Category({
    this.id,
    required this.name,
  });

  Map<String, Object?> toMap() {
    return {
      'category_id': id,
      'category_name': name,
    };
  }

  factory Category.fromMap(Map<String, Object?> map) {
    return Category(
      id: map['category_id'] as int,
      name: map['category_name'] as String,
    );
  }
}