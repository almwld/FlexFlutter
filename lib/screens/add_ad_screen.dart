import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AddAdScreen extends StatefulWidget {
  const AddAdScreen({super.key});

  @override
  State<AddAdScreen> createState() => _AddAdScreenState();
}

class _AddAdScreenState extends State<AddAdScreen> {
  String? _selectedCategory;
  final List<String> _categories = ['سيارات', 'عقارات', 'جنابي', 'مطاعم', 'VIP وعروض حصرية'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أضف إعلانك الجديد')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم رفع الصور
            _buildImagePicker(),
            const SizedBox(height: 25),

            // اختيار التصنيف
            const Text('تصنيف الإعلان', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildCategoryDropdown(),

            const SizedBox(height: 20),
            
            // بيانات الإعلان الأساسية
            _buildTextField('عنوان الإعلان', Icons.title),
            _buildTextField('السعر (ريال يمني)', Icons.money, isNumber: true),
            _buildTextField('وصف الإعلان', Icons.description, maxLines: 4),
            
            const SizedBox(height: 20),
            
            // اختيار الموقع
            _buildLocationSelector(),

            const SizedBox(height: 30),

            // زر النشر
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('جاري معالجة الإعلان ونشره...'), backgroundColor: AppTheme.goldColor),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.goldColor,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text('نشر الإعلان الآن', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: AppTheme.goldColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppTheme.goldColor, style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.add_a_photo_outlined, size: 40, color: AppTheme.goldColor),
          SizedBox(height: 10),
          Text('أضف صور الإعلان (حتى 5 صور)', style: TextStyle(color: AppTheme.goldColor)),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: const Text('اختر الفئة'),
          value: _selectedCategory,
          items: _categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
          onChanged: (val) => setState(() => _selectedCategory = val),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppTheme.goldColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppTheme.goldColor), borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildLocationSelector() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.location_on_outlined, color: AppTheme.goldColor),
      title: const Text('تحديد الموقع على الخريطة'),
      subtitle: const Text('صنعاء، عدن، تعز...'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () => Navigator.pushNamed(context, '/map'),
    );
  }
}
