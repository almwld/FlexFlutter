import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WalletService {
  static final _supabase = Supabase.instance.client;

  // جلب الرصيد مع دعم الأوفلاين
  static Future<double> getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return 0.0;

      final data = await _supabase.from('wallets').select('balance').eq('user_id', userId).single();
      final balance = (data['balance'] as num).toDouble();
      
      // حفظ للعمل أوفلاين
      await prefs.setDouble('cached_balance', balance);
      return balance;
    } catch (e) {
      // في حال انقطاع النت، ارجع للقيمة المخزنة
      return prefs.getDouble('cached_balance') ?? 0.0;
    }
  }

  // جلب العمليات مع دعم الأوفلاين
  static Future<List<Map<String, dynamic>>> getTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    
    try {
      final response = await _supabase.from('transactions').select().order('created_at');
      await prefs.setString('cached_txs', jsonEncode(response));
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      final cached = prefs.getString('cached_txs');
      return cached != null ? List<Map<String, dynamic>>.from(jsonDecode(cached)) : [];
    }
  }
}
