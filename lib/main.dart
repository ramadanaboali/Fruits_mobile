import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fruits/utils/app_LocalizationDeledate.dart';
import 'package:fruits/views/FirstLanguage.dart';
import 'package:fruits/views/HomePage.dart';
import 'package:fruits/views/Orders.dart';
import 'package:fruits/views/Login.dart';
import 'package:fruits/views/Slider.dart';
import 'package:fruits/views/VerificationCode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fruits/splash.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ScopeModel/AppSCoedModel.dart';
import 'ScopeModel/Base_View.dart';
import 'ScopeModel/Locator_Service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(Phoenix(child: ParentPage()));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class Home extends StatelessWidget {
  int mainColor = 0xff64B904;
  int whiteMainColor = 0xffFFC985;
  int blackColor = 0xff263238;
  @override
  Widget build(BuildContext context) {
    return BaseView<AppModel>(
        builder: (context, child, model) => MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale("en", ""), // OR Locale('ar', 'AE') OR Other RTL locales
                Locale("ar", ""),
              ],
              //locale:  Locale("ar", ""),
              locale:
                  _State.lang == null ? model.appLocal : Locale(_State.lang),
              theme: ThemeData(
                  fontFamily: 'Cairo', accentColor: Color(0xff64B904)),
              routes: <String, WidgetBuilder>{
                '/Slider': (BuildContext context) => new slider(),
                '/FirstLanguage': (BuildContext context) => new FirstLanguage(),
                '/mainPage': (BuildContext context) => new HomePage(0),
                '/VerificationCode': (BuildContext context) =>
                    new VerificationCode(),
                '/Orders': (BuildContext context) => new Orders(),
                '/Profile': (BuildContext context) => new HomePage(3),
              },
              home: Splash(),
            ));
  }
}

class ParentPage extends StatefulWidget {
  static int counter;
  static String language;
  static double TotalPrice;
  static String user_id;
  @override
  _State createState() => _State();
}

class _State extends State<ParentPage> {
  static String lang;
  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lang = prefs.get('lang');
      ParentPage.TotalPrice = double.parse(prefs.get('price'));
      ParentPage.language = prefs.get('lang');
      ParentPage.user_id = prefs.get('UserId');
    });
  }

  String _message = '';
  String _tokenAccess = '';
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     new FlutterLocalNotificationsPlugin();

  // final FirebaseMessaging _firebaseMessaging =new  FirebaseMessaging();

  // _register() async {
  //   await _firebaseMessaging.getToken().then((token) {
  //     SharedPreferences.getInstance().then((shared) {
  //       shared.setString('device_token', token);
  //     });

  //     print(
  //         '${token},,,,,,toookkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
  //   });
  //   print(
  //       "_____________________________________________________________________________________________________________");
  // }

  // void getMessage() async {
  //   _firebaseMessaging.configure(
  //       onMessage: (Map<String, dynamic> message) async {
  //         showNotificationsFunc(message);
  //         print('on message $message');
  //         setState(() => _message = message["notification"]["title"]);
  //       }, onResume: (Map<String, dynamic> message) async {
  //     print('on resume $message');
  //     setState(() => _message = message["notification"]["title"]);
  //   }, onLaunch: (Map<String, dynamic> message) async {
  //     print('on launch $message');
  //     setState(() => _message = message["notification"]["title"]);
  //   });
  // }

  // showNotificationsFunc(Map<String, dynamic> message) async {
  //   var android = AndroidNotificationDetails(
  //       'channel_id', 'CHANNEL_NAME', 'channelDescription');
  //   var ios = IOSNotificationDetails();
  //   var platform = new NotificationDetails(android, ios);
  //   await flutterLocalNotificationsPlugin.show(
  //       0,
  //       message['notification']['title'].toString(),
  //       message['notification']['body'].toString(),
  //       platform);
  // }

  @override
  void initState() {
    // TODO: implement initState
    //  secureScreen();
    super.initState();
    // var android = new AndroidInitializationSettings('mipmap/launcher_icon');
    // var ios = IOSInitializationSettings();
    // var platform = InitializationSettings(android, ios);
    // flutterLocalNotificationsPlugin.initialize(platform);
    // getMessage();
    // _register();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
