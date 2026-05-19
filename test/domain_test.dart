import 'package:dart_application_1/src/domain/data/models/category.dart';
import 'package:dart_application_1/src/domain/data/models/product.dart';
import 'package:test/test.dart';

void main() {
  group('Тесты доменных моделей (Domain)', () {
    test('Модель Category инициализируется корректно', () {
      final category = Category(id: 1, name: 'Собаки');
      expect(category.id, 1);
      expect(category.name, 'Собаки');
    });

    test('Модель Product инициализируется корректно', () {
      final product = Product(id: 1, name: 'Корм', price: 150.0, stock: 10, categoryId: 1);
      expect(product.name, 'Корм');
      expect(product.price, 150.0);
    });
  });
}