import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../firebase_options.dart';


@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
}

class FirebaseSetup {
  FirebaseSetup._();
  static FirebaseSetup get instance => FirebaseSetup._();

  String? _verificationId;
  UserCredential? user;


  String channelId = 'basic_channel';
  String channelName = 'Basic Notification Channel';


  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  Future<void> handleMessage(RemoteMessage m) async{
    return await showNotification('${m.notification?.title}', '${m.notification?.body}');
  }

  Future<void> init() async {

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((v){
      log("Firebase Connected Successfully !!!");
    });
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.setAutoInitEnabled(true);
    messaging.requestPermission(alert: true, sound: true);
    //messaging.subscribeToTopic("all");
    messaging.getInitialMessage();

    FirebaseMessaging.onBackgroundMessage(handleMessage);
    FirebaseMessaging.onMessage.listen((m) {
      if (m.notification != null) {
        showNotification('${m.notification?.title}', '${m.notification?.body}');
      }
    });
  }

  int id = 1;
  Future<void> showNotification(String title, String body) async {

      AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(channelId, channelName,

          priority: Priority.high);
      DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails(presentAlert: true,
        presentBadge: true,
        presentSound: true);
      NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          iOS: darwinNotificationDetails
      );
      const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      InitializationSettings initializationSettings = InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: initializationSettingsIOS);
      await _plugin.initialize(
        settings: initializationSettings,
        onDidReceiveNotificationResponse: (
            NotificationResponse notificationResponse) async {},
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      );


      return await _plugin.show(
          id: id++,
          title: title,
          body: body,
          notificationDetails: notificationDetails,
          payload: "Item X"
      ).then((v){
        log("message=>");
      }).whenComplete((){
        log("Send notification Successfully !!!");
      });


  }

  Future<void> sendOTP(String phoneNo) async {
      try {
        log("Phone Number=>$phoneNo");
        FirebaseAuth auth = FirebaseAuth.instance;
        return await auth.verifyPhoneNumber(
          phoneNumber: phoneNo,
          timeout: Duration(seconds: 30),
          verificationCompleted: (v) {
            _verificationId = v.toString();
          },
          verificationFailed: (v) {
            _verificationId = v.toString();
          },
          codeSent: (v, otp) {
            _verificationId = v.toString();
            log("Otp Send Successfully !!!");
          },
          codeAutoRetrievalTimeout: (t) {
            log("TimeOut Exception=>$t");
          },
        );
      }
      on FirebaseAuthException catch(e){
        log("message=>$e");
        throw Exception(e);
      }
      catch(e){
        log("Exception=>$e");
        throw Exception(e);
      }

  }

  Future<UserCredential?> verifyOtp(String smsCode) async {

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId.toString(),
        smsCode: smsCode,
      );
      user = await auth.signInWithCredential(credential);
    } on FormatException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }

}
