import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { food, home, transport, entertaiment }

List<Category> list = Category.values;

class Expanse {
  Expanse(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
