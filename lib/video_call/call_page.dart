import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthify/user/home_page/home_screen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';


class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID,required this.name, required this.uid}) : super(key: key);
  final String callID;
  final String name;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1364058413, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "4f4395353daae5dcacdec6eb9df74ce7c649b9e572dc462ea02ab87708ffbaf8", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: uid,
      userName: name,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
      ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
      //= (context) => Navigator.of(context).pop(),
    );
  }
}
