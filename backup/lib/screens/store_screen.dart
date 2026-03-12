import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StoreScreen extends StatelessWidget {
  final VoidCallback onAdd;

  const StoreScreen({super.key, required this.onAdd});

  Widget _buildCategoryCard(IconData icon, String name, Color color) {
    return InkWell(
      onTap: onAdd,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(20),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1.1,
      children: [
        _buildCategoryCard(Icons.shopping_cart_outlined, "الماركت", Colors.orange),
        _buildCategoryCard(Icons.restaurant_outlined, "المطاعم", Colors.red),
        _buildCategoryCard(Icons.phone_iphone, "التقنية", Colors.blue),
        _buildCategoryCard(Icons.watch_outlined, "اكسسوارات", Colors.purple),
        _buildCategoryCard(Icons.local_hospital_outlined, "الصحية", Colors.green),
        _buildCategoryCard(Icons.more_horiz, "المزيد", Colors.grey),
      ],
    );
  }
}
