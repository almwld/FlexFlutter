import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'dart:async';

class AuctionScreen extends StatefulWidget {
  const AuctionScreen({super.key});

  @override
  State<AuctionScreen> createState() => _AuctionScreenState();
}

class _AuctionScreenState extends State<AuctionScreen> {
  double currentBid = 550000.0;
  int secondsRemaining = 3600; // ساعة واحدة
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() => secondsRemaining--);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _placeBid() {
    setState(() => currentBid += 5000);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تمت المزايدة بنجاح! السعر الجديد: $currentBid'), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المزادات المباشرة')),
      body: Column(
        children: [
          // كرت المزاد الرئيسي
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/auction_item.jpg'), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [Colors.black, Colors.transparent])),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('جنبية صيفاني فخر يمني', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text('الوقت المتبقي: ${Duration(seconds: secondsRemaining).toString().split('.').first}', 
                       style: const TextStyle(color: AppTheme.goldColor, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // منطقة المزايدة
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('أعلى مزايدة حالياً:', style: TextStyle(fontSize: 18)),
                      Text('$currentBid ريال', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
                    ],
                  ),
                  const Divider(height: 40),
                  const Text('سجل المزايدات الأخيرة', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text('مزايد رقم ${index + 1}'),
                        trailing: Text('${currentBid - (index * 1000)} ريال'),
                      ),
                    ),
                  ),
                  
                  // زر المزايدة
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _placeBid,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.goldColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text('زايد الآن (+5,000 ريال)', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
