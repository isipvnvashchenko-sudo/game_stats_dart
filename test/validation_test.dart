import 'package:dart_application_1/src/domain/data/models/validators/text_validator.dart';
import 'package:dart_application_1/src/domain/data/models/validators/number_validator.dart';
import 'package:test/test.dart';

void main() {
  group('Тесты валидации (Validation)', () {
    test('Текст не пустой', () {
      expect(isValidText('Корм для кошек'), true);
    });

    test('Пустая строка невалидна', () {
      expect(isValidText('   '), false);
      expect(isValidText(''), false);
    });

    test('Число больше 0', () {
      expect(isPositiveNumber(10), true);
      expect(isPositiveNumber(0.5), true);
    });

    test('Отрицательное число или 0 невалидно', () {
      expect(isPositiveNumber(0), false);
      expect(isPositiveNumber(-5), false);
    });
  });
}