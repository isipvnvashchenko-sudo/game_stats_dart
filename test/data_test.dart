import 'package:dart_application_1/src/domain/data/repositories/category_repository.dart';
import 'package:dart_application_1/src/domain/data/repositories/product_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Тесты репозиториев (Data)', () {
    test('CategoryRepository создается успешно', () {
      final repo = CategoryRepository();
      expect(repo, isNotNull);
    });

    test('ProductRepository создается успешно', () {
      final repo = ProductRepository();
      expect(repo, isNotNull);
    });
  });
}