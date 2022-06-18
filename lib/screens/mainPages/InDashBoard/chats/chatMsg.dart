import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/screens/mainPages/InDashBoard/chats/chat.dart';

class Chatt {
  final String chatId;
  final bool isActive;
  final String recieverId;
  final String senderId;

  const Chatt(
      {required this.chatId,
      required this.isActive,
      required this.senderId,
      required this.recieverId});

  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "isActive": isActive,
        "senderId": senderId,
        "recieverId": recieverId,
      };

  static Chatt fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Chatt(
        chatId: snapshot['chatId'],
        isActive: snapshot['isActive'],
        senderId: snapshot['senderId'],
        recieverId: snapshot['recieverId']);
  }
}

class ChatMsg {
  String content;
  String timeSent;
  String senderId;
  String recieverId;
  int type;

  ChatMsg({
    required this.content,
    required this.timeSent,
    required this.senderId,
    required this.recieverId,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "content": this.content,
      "timeSent": this.timeSent,
      "senderId": this.senderId,
      "recieverId": this.recieverId,
      "type": this.type,
    };
  }

  factory ChatMsg.fromDocument(DocumentSnapshot doc) {
    String content = doc.get('content');
    String timeSent = doc.get('timeSent');
    String senderId = doc.get('senderId');
    String recieverId = doc.get('recieverId');
    int type = doc.get('type');

    return ChatMsg(
        content: content,
        timeSent: timeSent,
        senderId: senderId,
        recieverId: recieverId,
        type: type);
  }
}
