export 'src/domain/data/cli/menu.dart';
export 'src/domain/data/database.dart';
import 'src/domain/data/models/customer.dart';

class Client extends Customer {
  Client({
    super.id,
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.email,
  });
}