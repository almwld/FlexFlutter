import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تتبع طلباتي')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildOrderCard(
            context,
            orderId: '#FLX-99281',
            status: 'قيد التوصيل',
            date: '12 مارس 2026',
            currentStep: 2,
          ),
          const SizedBox(height: 20),
          _buildOrderCard(
            context,
            orderId: '#FLX-99104',
            status: 'تم التسليم',
            date: '10 مارس 2026',
            currentStep: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, {required String orderId, required String status, required String date, required int currentStep}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(orderId, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppTheme.goldColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(status, style: const TextStyle(color: AppTheme.goldColor, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const Divider(height: 30),
            _buildTimeline(currentStep),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(int currentStep) {
    List<String> steps = ['تم الطلب', 'التجهيز', 'شُحن', 'وصل'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(steps.length, (index) {
        bool isCompleted = index <= currentStep;
        return Column(
          children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? AppTheme.goldColor : Colors.grey[300],
              size: 20,
            ),
            const SizedBox(height: 5),
            Text(steps[index], style: TextStyle(fontSize: 10, color: isCompleted ? Colors.black : Colors.grey)),
          ],
        );
      }),
    );
  }
}
