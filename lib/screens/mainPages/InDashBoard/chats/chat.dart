import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/Services/UModel.dart' as model;
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/InDashBoard/chats/chatScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

import 'chatMsg.dart';

class mainChatsScreen extends StatefulWidget {
  const mainChatsScreen({Key? key}) : super(key: key);

  @override
  State<mainChatsScreen> createState() => _mainChatsScreenState();
}

class _mainChatsScreenState extends State<mainChatsScreen> {
  Stream? chatRoomStream;
  var myData = {};
  var sellerData = {};

  getData(x) async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      var snap2 =
          await FirebaseFirestore.instance.collection('users').doc('$x').get();

      myData = snap.data()!;
      sellerData = snap2.data()!;

      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// void initState(){
//   super.initState();
//   getData(uid);
// }
// var contactData = {};
//   getData(uid) async {
//     try {
//       var snap = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(uid)
//           .get();
//
//       contactData = snap.data()!;
//
//       setState(() {});
//     } catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }

  @override
  Widget build(BuildContext context) {
    List contracts = [];

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: offersColor,
          title: Text(
            "Chats",
            style: TextStyle(color: primaryColor),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                }
                var userDocument = snapshot.data;
                List x = userDocument!['activeContracts'];

                return ListView.builder(
                  itemCount: x.length,
                  itemBuilder: (context, index) {
                    getData(userDocument!['activeContracts'][index]);
                    return x.isEmpty
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.4),
                                child: Center(
                                  child: Flexible(
                                      child: Text(
                                    "You don't have any open chats at the moment",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                ),
                              ),
                              DetailsInformation(
                                  'Chats will open automatically with the seller when you buy an offer')
                            ],
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.8)),
                            child: ListTile(
                              onTap: () {
                                navigateTo(
                                    context,
                                    chatScreen(
                                        peerAvatar:
                                            sellerData['profilePhotoUrl'],
                                        peerId: sellerData['uid'],
                                        peerName: sellerData['fname'] +
                                            " " +
                                            sellerData['lname'],
                                        userAvatar:
                                            userDocument['profilePhotoUrl']));
                              },
                              contentPadding: EdgeInsets.all(8),
                              leading: CircleAvatar(
                                backgroundColor: primaryColor,
                                backgroundImage:
                                    NetworkImage(sellerData['profilePhotoUrl']),
                                radius: 30,
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${sellerData['fname']} ${sellerData['lname']}',
                                      style: TextStyle(
                                          fontSize: 24, color: offersColor),
                                    ),
                                  ),
                                  Icon(
                                    Icons.send,
                                    color: offersColor,
                                  )
                                ],
                              ),
                            ),
                          );
                  },
                );
              }),
        ));
  }
}
