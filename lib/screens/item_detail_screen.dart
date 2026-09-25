import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee_item.dart';
import '../providers/order_provider.dart';

class ItemDetailScreen extends StatefulWidget {
  final CoffeeItem item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  String _selectedSize = 'Medium';
  String _selectedMilk = 'Whole Milk';
  int _sugars = 0;

  final List<String> _sizes = ['Small', 'Medium', 'Large'];
  final List<String> _milks = ['Whole Milk', 'Oat Milk', 'Almond Milk', 'Skim Milk', 'None'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBEB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF2C1810)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.item.imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.item.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C1810),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$${widget.item.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD97706),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.item.description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),

            // Customization Section
            if (widget.item.category != 'Bakery') ...[
              const Text(
                'Select Size',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _sizes.map((size) {
                  return ChoiceChip(
                    label: Text(size),
                    selected: _selectedSize == size,
                    selectedColor: const Color(0xFFD97706),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: _selectedSize == size ? Colors.white : const Color(0xFF2C1810),
                    ),
                    onSelected: (selected) {
                      setState(() => _selectedSize = size);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose Milk',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _milks.map((milk) {
                  return ChoiceChip(
                    label: Text(milk),
                    selected: _selectedMilk == milk,
                    selectedColor: const Color(0xFFD97706),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: _selectedMilk == milk ? Colors.white : const Color(0xFF2C1810),
                    ),
                    onSelected: (selected) {
                      setState(() => _selectedMilk = milk);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sugars',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_sugars > 0) setState(() => _sugars--);
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text('$_sugars', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                        onPressed: () {
                          if (_sugars < 5) setState(() => _sugars++);
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
            ],
            const SizedBox(height: 40),

            // Add to Order Button
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
                  Provider.of<OrderProvider>(context, listen: false).addToCenterCartOrOrder(
                    widget.item,
                    _selectedSize,
                    _selectedMilk,
                    _sugars,
                  );
                  // Adding helper call
                  Provider.of<OrderProvider>(context, listen: false).addToCart(
                    widget.item,
                    _selectedSize,
                    _selectedMilk,
                    _sugars,
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added ${widget.item.name} to order!'),
                      backgroundColor: const Color(0xFFD97706),
                    ),
                  );
                },
                child: const Text(
                  'Add to Order',
                  style: TextStyle(
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
    );
  }
}
