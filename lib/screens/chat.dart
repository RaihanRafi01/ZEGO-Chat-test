import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ZIMKitDemoHomePage extends StatelessWidget {
  const ZIMKitDemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Conversations'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ZIMKit().showDefaultNewPeerChatDialog(context);
          },
          child: const Icon(Icons.add),
        ),
        body: ZIMKitConversationListView(
          // Customizing the conversation list UI
          itemBuilder: (context, conversation, defaultWidget) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 24,
                  child: Text(
                    conversation.name[0],
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  conversation.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Last message: ${conversation.lastMessage!.textContent!.text ?? ''}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ZIMKitMessageListPage(
                        conversationID: conversation.id,
                        conversationType: conversation.type,
                      );
                    },
                  ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
