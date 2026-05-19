import 'dart:convert';
import 'dart:io';
import 'package:dart_application_1/dart_application_1.dart';

void main() async {
  stdout.encoding = utf8;
  stderr.encoding = utf8;
  final menu = Menu();
  await menu.run();
}