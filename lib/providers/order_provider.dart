import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/coffee_item.dart';

class OrderProvider with ChangeNotifier {
  final List<CartItem> _cart = [];
  final List<Map<String, dynamic>> _orderHistory = [];
  String _fulfillmentMethod = 'Pickup';

  List<CartItem> get cart => _cart;
  List<Map<String, dynamic>> get orderHistory => _orderHistory;
  String get fulfillmentMethod => _fulfillmentMethod;

  void setFulfillmentMethod(String method) {
    _fulfillmentMethod = method;
    notifyListeners();
  }

  void addToCart(CoffeeItem item, String size, String milk, int sugars) {
    final existingIndex = _cart.indexWhere((element) =>
        element.item.id == item.id &&
        element.size == size &&
        element.milk == milk &&
        element.sugars == sugars);

    if (existingIndex >= 0) {
      _cart[existingIndex].quantity += 1;
    } else {
      _cart.add(CartItem(
        item: item,
        size: size,
        milk: milk,
        sugars: sugars,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int delta) {
    _cart[index].quantity += delta;
    if (_cart[index].quantity <= 0) {
      _cart.removeAt(index);
    }
    notifyListeners();
  }

  double get subtotal {
    return _cart.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double get tax => subtotal * 0.08;

  double get total => subtotal + tax;

  void checkout() {
    if (_cart.isEmpty) return;
    
    final order = {
      'id': 'SR-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      'date': DateTime.now(),
      'items': List<CartItem>.from(_cart),
      'total': total,
      'method': _fulfillmentMethod,
      'status': 'Preparing',
    };

    _orderHistory.insert(0, order);
    _cart.clear();
    notifyListeners();
  }
}
