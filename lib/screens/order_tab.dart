import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        if (orderProvider.cart.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Your order is empty',
                  style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Add some delicious coffee or snacks to start',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: orderProvider.cart.length,
                itemBuilder: (context, index) {
                  final cartItem = orderProvider.cart[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            cartItem.item.imageUrl,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF2C1810),
                                ),
                              ),
                              const SizedBox(height: 2),
                              if (cartItem.item.category != 'Bakery')
                                Text(
                                  '${cartItem.size} | ${cartItem.milk} | Sugars: ${cartItem.sugars}',
                                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                                ),
                              const SizedBox(height: 6),
                              Text(
                                '$${cartItem.totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Color(0xFFD97706),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => orderProvider.updateQuantity(index, -1),
                                  child: const Icon(Icons.remove, size: 18, color: Colors.grey),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    '${cartItem.quantity}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => orderProvider.updateQuantity(index, 1),
                                  child: const Icon(Icons.add, size: 18, color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () => orderProvider.removeFromCart(index),
                              child: const Text('Remove', style: TextStyle(color: Colors.red, fontSize: 11)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal'),
                      Text('$${orderProvider.subtotal.toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Estimated Tax (8%)'),
                      Text('$${orderProvider.tax.toStringAsFixed(2)}'),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        '$${orderProvider.total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFFD97706),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C1810),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        orderProvider.checkout();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Order Placed!'),
                            content: const Text('Your Sunrise Coffee order is being brewed with love. Check the Activity tab for updates.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK', style: TextStyle(color: Color(0xFFD97706))),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        'Place Order (${orderProvider.fulfillmentMethod})',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
