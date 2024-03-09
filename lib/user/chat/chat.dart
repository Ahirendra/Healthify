import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
class Chat extends StatefulWidget{
  @override
  State<Chat> createState() => _chat();
}
class _chat extends State<Chat>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("Conversations",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            position: PopupMenuPosition.under,
            icon: Icon(CupertinoIcons.add_circled),
            itemBuilder: (context){
            return [
              PopupMenuItem(child: ListTile(

                leading: Icon(CupertinoIcons.chat_bubble_text_fill),
                title: Text("New Chat", maxLines: 1,),
              ),
                onTap: ()=>ZIMKit().showDefaultNewPeerChatDialog(context),
              )
            ];
          },
          )
        ],
      ),
      body: ZIMKitConversationListView(
        theme: ThemeData(
          primaryColor: Colors.blue[200]
        ),
        onPressed: (context, conversation, defaultAction){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ZIMKitMessageListPage(
              conversationID: conversation.id,
              conversationType: conversation.type,);
          }));
        },
      ),
    );
  }
}