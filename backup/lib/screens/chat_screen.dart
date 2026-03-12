import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدردشة')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                _buildMessage("السلام عليكم، هل المنتج متاح؟", true),
                _buildMessage("وعليكم السلام، نعم متاح يا غالي.", false),
                _buildMessage("كم نهايتك في السعر؟", true),
              ],
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? AppTheme.goldColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(text, style: TextStyle(color: isMe ? Colors.black : Colors.black87)),
      ),
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.send, color: AppTheme.goldColor), onPressed: () {}),
          const Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(hintText: 'اكتب رسالتك...', border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
