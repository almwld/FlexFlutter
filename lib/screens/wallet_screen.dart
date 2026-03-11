import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double balance = 32450.75;
  bool isHidden = false;
  int currentCard = 0;

  final List<Map<String, dynamic>> cards = [
    {
      'name': 'حساب ريال يمني',
      'balance': 32450.75,
      'currency': 'ر.ي',
      'color': AppTheme.goldColor,
      'type': 'جاري',
    },
    {
      'name': 'حساب دولار',
      'balance': 150.00,
      'currency': '\$',
      'color': Colors.grey[800],
      'type': 'توفير',
    },
  ];

  final List<Map<String, dynamic>> services = [
    {'name': 'الشحن والسداد', 'icon': Icons.receipt_long, 'color': Colors.orange},
    {'name': 'شبكة تحويل', 'icon': Icons.account_balance, 'color': Colors.red},
    {'name': 'تحويلات مالية', 'icon': Icons.swap_horiz, 'color': Colors.green},
    {'name': 'سحب نقدي', 'icon': Icons.atm, 'color': Colors.blue},
    {'name': 'دفع المشتريات', 'icon': Icons.shopping_bag, 'color': Colors.purple},
    {'name': 'شراء اونلاين', 'icon': Icons.language, 'color': Colors.teal},
    {'name': 'جيبي', 'icon': Icons.account_wallet, 'color': Colors.pink},
    {'name': 'خدمات ترفيه', 'icon': Icons.games, 'color': Colors.indigo},
    {'name': 'المدفوعات', 'icon': Icons.payments, 'color': Colors.amber},
  ];

  final List<Map<String, dynamic>> transactions = [
    {'name': 'تحويل إلى أحمد', 'amount': -500, 'date': 'اليوم', 'icon': Icons.send},
    {'name': 'إيداع نقدي', 'amount': 5000, 'date': 'أمس', 'icon': Icons.add},
    {'name': 'شراء من متجر', 'amount': -1200, 'date': 'أمس', 'icon': Icons.shopping_cart},
    {'name': 'استلام تحويل', 'amount': 10000, 'date': '22/03', 'icon': Icons.received},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // شريط العنوان
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'رمضان كريم',
                          style: TextStyle(
                            color: AppTheme.goldColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'أحمد',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // البانر الترويجي
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[900]?.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red, size: 20),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: Text(
                        'اضغط هنا لمزامنة الاقتراحات والمفضلة بين أجهزتك',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Icon(Icons.refresh, color: Colors.red),
                  ],
                ),
              ),
            ),

            // نص التمرير
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'اسحب للأسفل للتحديث',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // بطاقة الرصيد الرئيسية
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: PageView.builder(
                  itemCount: cards.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentCard = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            card['color'],
                            card['color'].withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: card['color'].withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // نمط خلفي
                          Positioned(
                            left: -50,
                            bottom: -50,
                            child: Opacity(
                              opacity: 0.1,
                              child: Icon(
                                Icons.account_balance_wallet,
                                size: 200,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                          ),
                          // المحتوى
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // الشعار
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.account_balance_wallet,
                                          color: Colors.black.withOpacity(0.8),
                                          size: 30,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'FLEX',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // نوع الحساب
                                    Text(
                                      card['name'],
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                // الرصيد
                                Text(
                                  isHidden ? '••••••' : '${card['balance'].toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  card['currency'],
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 16,
                                  ),
                                ),
                                const Spacer(),
                                // أيقونة العين
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: Icon(
                                      isHidden ? Icons.visibility_off : Icons.visibility,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isHidden = !isHidden;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // مؤشر الصفحات
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    cards.length,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentCard == index ? AppTheme.goldColor : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // شبكة الخدمات
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final service = services[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: service['color'].withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              service['icon'],
                              color: service['color'],
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            service['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: services.length,
                ),
              ),
            ),

            // عنوان العمليات
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'العمليات',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // قائمة العمليات
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final tx = transactions[index];
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: tx['amount'] > 0 ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        tx['icon'],
                        color: tx['amount'] > 0 ? Colors.green : Colors.red,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      tx['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      tx['date'],
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                    trailing: Text(
                      '${tx['amount'] > 0 ? '+' : ''}${tx['amount'].toStringAsFixed(0)} ر.ي',
                      style: TextStyle(
                        color: tx['amount'] > 0 ? Colors.green : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                childCount: transactions.length,
              ),
            ),

            // مسافة للـ BottomNav
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
