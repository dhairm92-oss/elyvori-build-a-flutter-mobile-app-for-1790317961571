import 'package:flutter/material.dart';

class RewardsTab extends StatelessWidget {
  const RewardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2C1810), Color(0xFF4A2E1B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: const [
              Text(
                'Sunrise Rewards',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '320 Points',
                style: TextStyle(
                  color: Color(0xFFD97706),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '180 points away from a free drink!',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Available Rewards',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C1810),
          ),
        ),
        const SizedBox(height: 12),
        _buildRewardCard('Free Artisan Pastry', '150 Points', Icons.bakery_dining, true),
        _buildRewardCard('Any Size Handcrafted Coffee', '250 Points', Icons.coffee, true),
        _buildRewardCard('Sunrise Coffee Bean Bag', '500 Points', Icons.card_giftcard, false),
      ],
    );
  }

  Widget _buildRewardCard(String title, String points, IconData icon, bool canRedeem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBEB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFD97706)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF2C1810),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  points,
                  style: const TextStyle(
                    color: Color(0xFFD97706),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: canRedeem ? const Color(0xFFD97706) : Colors.grey[300],
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: canRedeem ? () {} : null,
            child: Text(
              canRedeem ? 'Redeem' : 'Locked',
              style: TextStyle(
                color: canRedeem ? Colors.white : Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
