import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<Splash>{
var lang;
loadDate()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  setState(() {
    lang=prefs.getString("lang");
  });
  print(lang);
  print("ssssssssssss");
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDate();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), (){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(lang==null?'/FirstLanguage':"/Slider",
              (Route<dynamic> route) => false);
      // Phoenix.rebirth(context);
    });
   return Scaffold(
     body: Image.asset("images/splash.png",
     height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       fit: BoxFit.cover,
     ),
   );
  }
}