import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class CustomText{

  static Widget text12(String text){
    return Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black54),);
  }
  static Widget text12green(String text){
    return Text(text,style: TextStyle(fontSize: 12,color: Color(0xff64B904)),);
  }
  static Widget textgreen(String text){
    return Text(text,style: TextStyle(fontSize: 14,color: Color(0xff64B904)),);
  }
  static Widget text12Bold(String text,Color color){
    return Text(text,style: TextStyle(height: 1.3,fontSize: 12,fontWeight: FontWeight.bold,color: color));
  }
  static Widget text10Bold(String text,Color color){
    return Text(text,style: TextStyle(height: 1.3,fontSize: 10,fontWeight: FontWeight.bold,color: color));
  }
  static Widget text12Boldcenter(String text,Color color){
    return Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: color),textAlign: TextAlign.center);
  }
  static Widget btnText(String text,Color color){
    return Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: color),textAlign: TextAlign.center,);
  }
  static Widget btnText14(String text,Color color){
    return Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: color),textAlign: TextAlign.center,);
  }

  static Widget titleText(String text){
    return Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,);
  }
  static Widget titleTextColor(String text,Color color){
    return Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: color),);
  }
}
