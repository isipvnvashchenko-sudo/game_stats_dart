import 'dart:convert';
import 'dart:io';
import 'package:dart_application_1/src/domain/data/models/validators/text_validator.dart';
import 'package:dart_application_1/src/domain/data/models/validators/number_validator.dart';

class InputHelper {
  static String ask(String message) {
    while (true) {
      stdout.write(message);
      final input = stdin.readLineSync(encoding: utf8) ?? '';
      
      if (isValidText(input)) {
        return input;
      }
      print('Ошибка: Поле не должно быть пустым или состоять из пробелов!');
    }
  }

  // Валидация целых чисел (используется для количества и ID)
  static int askInt(String message) {
    while (true) {
      stdout.write(message);
      final input = stdin.readLineSync(encoding: utf8);
      final value = int.tryParse(input ?? '');
      
      if (value != null && isPositiveNumber(value)) {
        return value;
      }
      print('Введите корректное число больше 0!');
    }
  }

  // Валидация дробных чисел (используется для цены)
  static double askDouble(String message) {
    while (true) {
      stdout.write(message);
      final input = stdin.readLineSync(encoding: utf8);
      final value = double.tryParse(input ?? '');
      
      if (value != null && isPositiveNumber(value)) {
        return value;
      }
      print('Введите корректное число больше 0!');
    }
  }
}