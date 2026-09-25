import 'coffee_item.dart';

class CartItem {
  final CoffeeItem item;
  final String size;
  final String milk;
  final int sugars;
  int quantity;

  CartItem({
    required this.item,
    required this.size,
    required this.milk,
    required this.sugars,
    this.quantity = 1,
  });

  double get totalPrice => item.price * quantity;
}
