import '../models/coffee_item.dart';

class CoffeeData {
  static final List<CoffeeItem> items = [
    CoffeeItem(
      id: '1',
      name: 'Sunrise Signature Latte',
      category: 'Coffee',
      price: 4.50,
      description: 'Our signature espresso with velvety steamed milk and a hint of vanilla and honey.',
      imageUrl: 'https://images.unsplash.com/photo-1561882468-9410e47375a8?auto=format&fit=crop&w=600&q=80',
    ),
    CoffeeItem(
      id: '2',
      name: 'Golden Hour Cappuccino',
      category: 'Coffee',
      price: 4.00,
      description: 'Equal parts espresso, steamed milk, and rich microfoam, dusted with cinnamon.',
      imageUrl: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80',
    ),
    CoffeeItem(
      id: '3',
      name: 'Cold Brew Oasis',
      category: 'Cold Drinks',
      price: 4.25,
      description: 'Slow-steeped for 24 hours for an ultra-smooth, naturally sweet coffee experience.',
      imageUrl: 'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?auto=format&fit=crop&w=600&q=80',
    ),
    CoffeeItem(
      id: '4',
      name: 'Iced Caramel Macchiato',
      category: 'Cold Drinks',
      price: 5.00,
      description: 'Fresh espresso poured over cold milk and ice, finished with a buttery caramel drizzle.',
      imageUrl: 'https://images.unsplash.com/photo-1485808191679-5f86510681a2?auto=format&fit=crop&w=600&q=80',
    ),
    CoffeeItem(
      id: '5',
      name: 'Matcha Green Tea Latte',
      category: 'Tea',
      price: 4.75,
      description: 'Premium ceremonial grade Japanese matcha whisked with lightly sweetened milk.',
      imageUrl: 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?auto=format&fit=crop&w=600&q=80',
    ),
    CoffeeItem(
      id: '6',
      name: 'Earl Grey Lavender Tea',
      category: 'Tea',
      price: 3.50,
      description: 'Classic black tea infused with bergamot and delicate French lavender blossoms.',
      imageUrl: 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?auto=format&fit=crop&w=600&q=80',
    ),
    CoffeeItem(
      id: '7',
      name: 'Morning Butter Croissant',
      category: 'Bakery',
      price: 3.25,
      description: 'Flaky, buttery layers baked fresh every morning until golden brown.',
      imageUrl: 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?auto=format&fit=crop&w=600&q=80',
    ),
    CoffeeItem(
      id: '8',
      name: 'Blueberry Sunrise Muffin',
      category: 'Bakery',
      price: 3.75,
      description: 'Packed with wild blueberries and topped with a crunchy brown sugar streusel.',
      imageUrl: 'https://images.unsplash.com/photo-1607958996333-41aef7caefcc?auto=format&fit=crop&w=600&q=80',
    ),
  ];
}
