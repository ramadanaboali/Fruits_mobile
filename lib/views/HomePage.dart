import 'package:fruits/utils/app_Localization.dart';

import 'Cart.dart';
import 'Profile.dart';

import '../main.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';
import 'Notification.dart';


class HomePage extends StatefulWidget {
  int index;
  HomePage(int index){
    this.index=index;
  }
  @override
  _State createState() => _State(this.index);
}
class _State extends State<HomePage> {
  int _currentIndex;
  _State(int index){
    this._currentIndex=index;
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Home h=new Home();
  List<Widget>itemsUi=[
    MainPage(),
    Notifications(),
    Cart(),
    ProFile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(h.mainColor),
      key: _scaffoldKey,
      body:itemsUi[_currentIndex],bottomNavigationBar:
    BottomNavigationBar(
        elevation: 15.5,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(h.mainColor),
        unselectedItemColor: Colors.black38
        ,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // print('${index}index');
          });
        },
        items: [
          BottomNavigationBarItem(
              icon:ImageIcon(AssetImage("images/homeIcon.png")),
              title:  Text(DemoLocalizations.of(context).title['home'],textAlign: TextAlign.center)),
          BottomNavigationBarItem(
              icon:  ImageIcon(AssetImage("images/NotificationIcon.png")),
              title: Text(DemoLocalizations.of(context).title['notification'],textAlign: TextAlign.center,)),
          BottomNavigationBarItem(
              icon:  ImageIcon(AssetImage("images/shoppingCard.png")),
              title: Text(DemoLocalizations.of(context).title['cart'],textAlign: TextAlign.center)),
          BottomNavigationBarItem(
              icon:ImageIcon(AssetImage("images/ProfileIcon.png")),
              title:  Text(DemoLocalizations.of(context).title['profile'],textAlign: TextAlign.center)),





        ]),



    );
  }
}