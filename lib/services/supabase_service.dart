import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;
  
  // المستخدم الحالي
  static User? get currentUser => client.auth.currentUser;
  
  // تسجيل الدخول
  static Future<AuthResponse> signIn(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }
  
  // إنشاء حساب
  static Future<AuthResponse> signUp(String email, String password, Map<String, dynamic> data) async {
    return await client.auth.signUp(
      email: email,
      password: password,
      data: data,
    );
  }
  
  // تسجيل الخروج
  static Future<void> signOut() async {
    await client.auth.signOut();
  }
  
  // جلب الإعلانات
  static Future<List<Map<String, dynamic>>> getAds({String? category, String? city}) async {
    var query = client.from('ads').select('*');
    
    if (category != null && category != 'الكل') {
      query = query.eq('category', category);
    }
    
    if (city != null && city != 'الكل') {
      query = query.eq('city', city);
    }
    
    final response = await query.order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }
  
  // إضافة إعلان
  static Future<void> addAd(Map<String, dynamic> adData) async {
    await client.from('ads').insert(adData);
  }
  
  // جلب المحادثات
  static Future<List<Map<String, dynamic>>> getChats(String userId) async {
    final response = await client
        .from('chats')
        .select('*, profiles:other_user_id(*)')
        .or('user_id.eq.$userId,other_user_id.eq.$userId')
        .order('last_message_time', ascending: false);
    
    return List<Map<String, dynamic>>.from(response);
  }
  
  // إرسال رسالة
  static Future<void> sendMessage(String chatId, String content) async {
    await client.from('messages').insert({
      'chat_id': chatId,
      'sender_id': currentUser!.id,
      'content': content,
    });
    
    await client.from('chats').update({
      'last_message': content,
      'last_message_time': DateTime.now().toIso8601String(),
    }).eq('id', chatId);
  }
  
  // جلب الرصيد
  static Future<double> getBalance(String userId) async {
    final response = await client
        .from('wallets')
        .select('balance')
        .eq('user_id', userId)
        .single();
    
    return (response['balance'] as num).toDouble();
  }
  
  // إجراء معاملة
  static Future<void> createTransaction(Map<String, dynamic> transaction) async {
    await client.from('transactions').insert(transaction);
    
    // تحديث الرصيد
    final currentBalance = await getBalance(transaction['user_id']);
    final newBalance = transaction['type'] == 'deposit' 
        ? currentBalance + transaction['amount']
        : currentBalance - transaction['amount'];
    
    await client.from('wallets').update({
      'balance': newBalance,
    }).eq('user_id', transaction['user_id']);
  }
  
  // الاستماع للرسائل الجديدة
  static Stream<List<Map<String, dynamic>>> messagesStream(String chatId) {
    return client
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('chat_id', chatId)
        .order('created_at')
        .map((data) => List<Map<String, dynamic>>.from(data));
  }
}
