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
  final String content;
  final String timeSent;
  final senderEmail;
  final recieverEmail;

  const ChatMsg(
      {required this.content,
      required this.timeSent,
      required this.senderEmail,
      required this.recieverEmail});

  Map<String, dynamic> toJson() => {
        "content": content,
        "timeSent": timeSent,
        "senderEmail": senderEmail,
        "recieverEmail": recieverEmail,
      };

  static ChatMsg fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ChatMsg(
        content: snapshot['content'],
        timeSent: snapshot['timeSent'],
        senderEmail: snapshot['senderEmail'],
        recieverEmail: snapshot['recieverEmail']);
  }
}
