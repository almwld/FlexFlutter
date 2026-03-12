import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final _phoneController = TextEditingController();
  final _amountController = TextEditingController();
  String? _selectedOperator;

  final List<Map<String, dynamic>> operators = [
    {'id': 'yemen_mobile', 'name': 'يمن موبايل', 'color': Colors.blue[900], 'prefix': '77'},
    {'id': 'you', 'name': 'يو (YOU)', 'color': Colors.yellow[700], 'prefix': '73'},
    {'id': 'sabafon', 'name': 'سبأفون', 'color': Colors.red[700], 'prefix': '71'},
    {'id': 'way', 'name': 'واي (Way)', 'color': Colors.orange[800], 'prefix': '70'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('الشحن والسداد', style: TextStyle(color: AppTheme.goldColor)),
        backgroundColor: const Color(0xFF1E1E1E),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('اختر شركة الاتصال', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // قائمة الشركات
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: operators.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedOperator == operators[index]['id'];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedOperator = operators[index]['id']),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.goldColor : const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: isSelected ? Colors.white : Colors.transparent, width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cell_tower, color: isSelected ? Colors.black : AppTheme.goldColor, size: 30),
                          const SizedBox(height: 8),
                          Text(
                            operators[index]['name'],
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // حقول الإدخال
            _buildInputField(
              controller: _phoneController,
              label: 'رقم الهاتف',
              hint: '7XXXXXXXX',
              icon: Icons.phone_android,
              isNumber: true,
            ),
            
            const SizedBox(height: 20),
            
            _buildInputField(
              controller: _amountController,
              label: 'المبلغ المعتمد',
              hint: 'أدخل المبلغ بالريال اليمني',
              icon: Icons.money,
              isNumber: true,
            ),

            const SizedBox(height: 40),

            // زر التأكيد
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.goldColor,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('تأكيد العملية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required TextEditingController controller, required String label, required String hint, required IconData icon, bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white24),
            prefixIcon: Icon(icon, color: AppTheme.goldColor),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppTheme.goldColor)),
          ),
        ),
      ],
    );
  }

  void _processPayment() {
    if (_selectedOperator == null || _phoneController.text.isEmpty || _amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('يرجى إكمال البيانات')));
      return;
    }
    // هنا سيتم ربط العملية بـ Supabase لاحقاً
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('تأكيد الطلب', style: TextStyle(color: AppTheme.goldColor)),
        content: Text('سيتم شحن مبلغ ${_amountController.text} إلى الرقم ${_phoneController.text} عبر شبكة $_selectedOperator', style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء', style: TextStyle(color: Colors.red))),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('تأكيد')),
        ],
      ),
    );
  }
}
