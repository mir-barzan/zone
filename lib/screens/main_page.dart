import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/paymentProcess/pzcoin.dart';
import 'package:zone/screens/auth/fire_auth.dart';
import 'package:zone/screens/auth/login1.dart';
import 'package:zone/screens/auth/signup.dart';
import 'package:zone/screens/mainPages/InDashBoard/chats/chatProvider.dart';
import 'package:zone/screens/mainPages/addOfferMain/addOfferScreen.dart';
import 'package:zone/screens/mainPages/addProjectScreen.dart';
import 'package:zone/screens/mainPages/InDashBoard/dashboard.dart';
import 'package:zone/screens/mainPages/OffersScreen.dart';
import 'package:zone/screens/mainPages/homeScreen/homeScreen.dart';
import 'package:zone/screens/mainPages/leaderboard/leaderboard.dart';
import 'package:zone/screens/mainPages/postScreen.dart';
import 'package:zone/screens/mainPages/profileScreen.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';
import 'package:showcaseview/showcaseview.dart';

class mainPage extends StatefulWidget {
  final isFromSettings;

  const mainPage({Key? key, required this.isFromSettings}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//this key for showcases
  int selectedIndex = 0;
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  final key4 = GlobalKey();
  final key5 = GlobalKey();
  final key6 = GlobalKey();
  final key7 = GlobalKey();
  final key8 = GlobalKey();
  final key9 = GlobalKey();
  final key10 = GlobalKey();
  final key11 = GlobalKey();

  @override
  void initState() {
    super.initState();
    getData();
    registerNotification();
    configureLocalNotification();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([
        key1,
        key2,
        key3,
        key4,
        key5,
        key6,
        key7,
        key8,
        key9,
        key10,
        key11,
      ]),
    );
  }

  int currentTab = 0;
  String uid = " ";
  var CurrentUserData = {};

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  getData() async {
    try {
      var snap2 = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      CurrentUserData = snap2.data()!;

      setState(() {
        uid = CurrentUserData['uid'];
      });
    } catch (e) {}
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboard();

  bool _isLoading = false;

  void registerNotification() {
    firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(message.notification!);
      }
      return;
    });
    firebaseMessaging.getToken().then((token) {
      if (token != null) {
        updateDataFirestore('users', FirebaseAuth.instance.currentUser!.uid,
            {'pushToken': token});
      }
    }).catchError((error) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  void configureLocalNotification() {
    AndroidInitializationSettings initializationAndroidSettings =
        AndroidInitializationSettings("a512");
    IOSInitializationSettings initializationIosSettings =
        IOSInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationAndroidSettings, iOS: initializationIosSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(RemoteNotification remoteNotification) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('com.zone.appers.zone', "The Zone",
            playSound: true,
            enableLights: true,
            enableVibration: true,
            importance: Importance.max,
            priority: Priority.high);

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin.show(0, remoteNotification.title,
        remoteNotification.body, notificationDetails,
        payload: null);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const homeScreen(),
      const dashboard(),
      const leaderBoard(),
      const postScreen(),
      const personalOffersScreen(),
      profileScreen(
        uid: uid,
        isVisiting: false,
      )
    ];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => setState(() {
                    ShowCaseWidget.of(context)!.startShowCase([
                      key1,
                      key2,
                      key3,
                      key4,
                      key5,
                      key6,
                      key7,
                      key8,
                      key9,
                      key10,
                      key11,
                    ]);
                  }),
                  icon: const Icon(
                    Icons.help_rounded,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
          backgroundColor: offersColor,
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/images/zoneLogo.svg',
            color: primaryColor,
            width: 180,
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      navigateTo(context, const pzcoin());
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                              child: Icon(
                            Icons.monetization_on,
                            color: offersColor,
                            size: 30,
                          )),
                          FittedBox(
                            child: Text(
                              "  0.0 ",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: offersColor,
                                  fontSize: 30.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
          bottom: TabBar(
            indicatorColor: primaryColor,
            tabs: [
              Tab(
                  text: 'Home',
                  icon: customeShowcaseWidget(
                    globalKey: key1,
                    desccription:
                        'Pressing this button will lead you to your home screen',
                    child: Icon(Icons.home),
                  )),
              Tab(
                text: 'Dashboard',
                icon: customeShowcaseWidget(
                  globalKey: key2,
                  desccription:
                      'Pressing this button will lead you to your dashboard screen',
                  child: Icon(Icons.dashboard),
                ),
              ),
              Tab(
                  text: 'Leader',
                  icon: customeShowcaseWidget(
                    globalKey: key3,
                    desccription:
                        'Pressing this button will lead you to Leader screen',
                    child: Icon(Icons.flag),
                  )),
              Tab(
                  text: 'Offers',
                  icon: customeShowcaseWidget(
                    globalKey: key4,
                    desccription:
                        'Pressing this button will lead you to offer screen',
                    child: Icon(Icons.local_offer),
                  )),
              Tab(
                  text: 'Profile',
                  icon: customeShowcaseWidget(
                    globalKey: key5,
                    desccription:
                        'Pressing this button will lead you to your profile screen',
                    child: Icon(Icons.person),
                  )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            customeShowcaseWidget(
                desccription:
                    'welcome to home screen where you can search for the offers or any thing else and filter them how you need',
                child: homeScreen(),
                globalKey: key7),
            customeShowcaseWidget(
              child: dashboard(),
              desccription:
                  'here is dashbord where you can navigate to the chats and look at the support also sales and your offers',
              globalKey: key8,
            ),
            customeShowcaseWidget(
              child: leaderBoard(),
              desccription:
                  'here is in this screen leader board where you can see the top freelancers rated by them sales',
              globalKey: key9,
            ),
            customeShowcaseWidget(
              child: personalOffersScreen(),
              desccription:
                  'here is   offers screen which can be easy to see the top offers also can search here for the ofeers too ;)7  ',
              globalKey: key10,
            ),
            customeShowcaseWidget(
              child: profileScreen(uid: uid, isVisiting: true),
              desccription:
                  'here is your profile  you can also edit it here by preesing edit buttun will lead you to profile edit screen' +
                      'or go to sseting and uppdate or log out your profile',
              globalKey: key11,
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(8),
          child: FloatingActionButton(
            child: customeShowcaseWidget(
              globalKey: key6,
              desccription:
                  ' press this add  button to open for  you  adding offer page to Add Offers  ',
              child: Icon(Icons.add),
            ),
            onPressed: () {
              navigateTo(context, addOfferScreen());
            },
            backgroundColor: secColor,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: primaryColor,
      ),
    );
  }
}

class customeShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String desccription;
  final GlobalKey globalKey;

  const customeShowcaseWidget({
    required this.desccription,
    required this.child,
    required this.globalKey,
  });
  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        showcaseBackgroundColor: Color.fromRGBO(5, 124, 120, 1),
        contentPadding: EdgeInsets.all(12),
        showArrow: true,
        disableAnimation: false,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 32),
        description: desccription,
        descTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        overlayColor: Colors.white,
        overlayOpacity: 0.3,
        child: child,
      );
}
