import 'package:supabase_flutter/supabase_flutter.dart';

class WalletService {
  static final _client = Supabase.instance.client;

  // الحصول على بيانات المحفظة والرصيد
  static Future<Map<String, dynamic>> getWalletData() async {
    final user = _client.auth.currentUser;
    if (user == null) return {'balance': 0.0};

    final response = await _client
        .from('wallets')
        .select()
        .eq('user_id', user.id)
        .single();
    return response;
  }

  // إجراء عملية مالية (إيداع/سحب/دفع)
  static Future<void> createTransaction({
    required String type,
    required double amount,
    required String description,
  }) async {
    final user = _client.auth.currentUser;
    if (user == null) return;

    // جلب معرف المحفظة أولاً
    final wallet = await getWalletData();

    await _client.from('wallet_transactions').insert({
      'wallet_id': wallet['id'],
      'user_id': user.id,
      'type': type,
      'amount': amount,
      'description': description,
    });
  }

  // الاستماع لتحديثات الرصيد لحظياً (Real-time)
  static Stream<List<Map<String, dynamic>>> getBalanceStream() {
    final user = _client.auth.currentUser;
    return _client
        .from('wallets')
        .stream(primaryKey: ['id'])
        .eq('user_id', user?.id ?? '')
        .map((data) => data);
  }
}
