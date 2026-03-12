import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سياسة الخصوصية')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اتفاقية الاستخدام والخصوصية - فلكس يمن',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.goldColor),
            ),
            const SizedBox(height: 15),
            _buildPolicySection('1. جمع البيانات', 'نقوم بجمع بيانات الهوية ورقم الهاتف لضمان أمان المعاملات المالية في المحفظة الإلكترونية.'),
            _buildPolicySection('2. العمليات المالية', 'تتم معالجة كافة العمليات المالية وفقاً للمعايير البنكية المتبعة في الجمهورية اليمنية، والمنصة غير مسؤولة عن التحويلات الخاطئة الناتجة عن إدخال بيانات غير صحيحة من قبل المستخدم.'),
            _buildPolicySection('3. أمن الحساب', 'المستخدم مسؤول مسؤولية كاملة عن الحفاظ على سرية كلمة المرور وبيانات بصمة الإصبع الخاصة به.'),
            _buildPolicySection('4. الإعلانات والمحتوى', 'يُمنع نشر أي محتوى يخالف القوانين النافذة أو الآداب العامة، ويحق للإدارة حذف أي إعلان مخالف دون سابق إنذار.'),
            const SizedBox(height: 30),
            const Center(child: Text('آخر تحديث: مارس 2026', style: TextStyle(color: Colors.grey, fontSize: 12))),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicySection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 5),
          Text(content, style: const TextStyle(color: Colors.grey, height: 1.5), textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}
