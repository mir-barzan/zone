import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zone/screens/mainPages/InDashBoard/chats/chatMsg.dart';

class ChatProvider {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ChatProvider({
    required this.prefs,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  UploadTask uploadFile(File image, String filename) {
    Reference reference = firebaseStorage.ref().child(filename);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getChatStream(String groupChatId, intLimit) {
    return firebaseFirestore
        .collection('chat')
        .doc(groupChatId)
        .collection('messages')
        .orderBy('timeSent', descending: true)
        .limit(intLimit)
        .snapshots();
  }

  void sendMessage(String groupChatId, String content, String senderId,
      String recieverId, int type) async {
    await firebaseFirestore
        .collection('chat')
        .doc(groupChatId)
        .collection('messages')
        .add({
      'content': content,
      'timeSent': DateTime.now().toString(),
      'senderId': senderId,
      'recieverId': recieverId,
      'stackHolders': [senderId, recieverId],
      'type': type,
    });
    // ChatMsg chatMsg = ChatMsg(
    //   content: content,
    //   timeSent: DateTime.now().toString(),
    //   senderId: senderId,
    //   recieverId: recieverId,
    //   type: type,
    //     stackHolders:[senderId,recieverId]
    // );
    // FirebaseFirestore.instance.runTransaction((transaction) async {
    //   await transaction.set(
    //     FirebaseFirestore.instance
    //         .collection('chat')
    //         .doc(groupChatId)
    //         .collection('messages')
    //         .doc(DateTime.now().toString()),
    //     chatMsg.toJson(),
    //   );
    // });
  }
}

class TypeMessage {
  static const int TEXT = 0;
  static const int IMAGE = 1;
  static const int Unknown = 2;
}
