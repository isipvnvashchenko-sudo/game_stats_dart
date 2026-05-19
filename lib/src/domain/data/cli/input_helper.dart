import 'dart:convert';
import 'dart:io';

class InputHelper {
  static String ask(String message) {
    stdout.write(message);
    return stdin.readLineSync(encoding: utf8) ?? '';
  }

  static int askInt(String message) {
    while (true) {
      stdout.write(message);
      final input = stdin.readLineSync(encoding: utf8);
      final value = int.tryParse(input ?? '');
      if (value != null) {
        return value;
      }
      print('Введите число!');
    }
  }

  static double askDouble(String message) {
    while (true) {
      stdout.write(message);
      final input = stdin.readLineSync(encoding: utf8);
      final value = double.tryParse(input ?? '');
      if (value != null && value > 0) {
        return value;
      }
      print('Введите корректное число!');
    }
  }
}