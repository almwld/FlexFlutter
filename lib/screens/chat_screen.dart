import 'package:flutter/material.dart';
import '../services/supabase_service.dart';
import '../theme/app_theme.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // شريط البحث
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'البحث في المحادثات...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
          // قائمة المحادثات
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: SupabaseService.getChats(SupabaseService.currentUser!.id),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final chats = snapshot.data!;
                
                if (chats.isEmpty) {
                  return const Center(
                    child: Text('لا توجد محادثات'),
                  );
                }

                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.goldColor,
                        child: Text(
                          chat['other_user_name']?[0] ?? '؟',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text(chat['other_user_name'] ?? 'مستخدم'),
                      subtitle: Text(
                        chat['last_message'] ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        _formatTime(chat['last_message_time']),
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailScreen(
                              chatId: chat['id'],
                              otherUserName: chat['other_user_name'] ?? 'مستخدم',
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // بدء محادثة جديدة
        },
        backgroundColor: AppTheme.goldColor,
        child: const Icon(Icons.chat, color: Colors.black),
      ),
    );
  }

  String _formatTime(String? time) {
    if (time == null) return '';
    final date = DateTime.parse(time);
    final now = DateTime.now();
    final diff = now.difference(date);
    
    if (diff.inDays > 0) return '${diff.inDays} يوم';
    if (diff.inHours > 0) return '${diff.inHours} ساعة';
    if (diff.inMinutes > 0) return '${diff.inMinutes} دقيقة';
    return 'الآن';
  }
}
