import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RatingSystem extends StatelessWidget {
  final double rating;
  final int totalReviews;

  const RatingSystem({super.key, required this.rating, required this.totalReviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: AppTheme.goldColor, size: 20),
            const SizedBox(width: 5),
            Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(width: 10),
            Text('($totalReviews تقييم)', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 10),
        _buildReviewItem('أحمد صالح', 'تاجر موثوق وسريع في التعامل، الجنبية كانت ممتازة.', 5),
        _buildReviewItem('محمد الحيمي', 'السيارة نظيفة جداً كما في الوصف، شكراً فلكس.', 4),
      ],
    );
  }

  Widget _buildReviewItem(String name, String comment, int stars) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(children: List.generate(5, (i) => Icon(Icons.star, size: 12, color: i < stars ? AppTheme.goldColor : Colors.grey))),
            ],
          ),
          const SizedBox(height: 5),
          Text(comment, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        ],
      ),
    );
  }
}
