import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'LangSetting.dart';

import '../main.dart';
import 'CustomText.dart';
import 'GlobalFunction.dart';

class Setting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Setting>{
  Home h=new Home();
  bool notifiction=true;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage("images/profileBG.png"), fit: BoxFit.contain),
       ),
       child: Container(
         child: Column(
           children: [
             SizedBox(height: MediaQuery.of(context).size.height*.07,),
             Container(
               width: MediaQuery.of(context).size.width*.9,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   CustomText.titleTextColor(DemoLocalizations.of(context).title['setting'],Colors.black),
                   GestureDetector(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: Container(
                       padding: EdgeInsets.only(top:10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           ParentPage.language=="ar"?ImageIcon(AssetImage("images/IconBack.png"),):Icon(Icons.arrow_forward_rounded,size: 30,),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*.05,),
             Container(
               margin: EdgeInsets.only(
                 left: MediaQuery.of(context).size.width*.05,
                 right: MediaQuery.of(context).size.width*.05,),
               padding: EdgeInsets.only(
                   left: MediaQuery.of(context).size.width*.02,
                   right: MediaQuery.of(context).size.width*.02,
                   top: MediaQuery.of(context).size.height*.01,
                   bottom: MediaQuery.of(context).size.height*.01
               ),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.2),
                     spreadRadius: 3,
                     blurRadius: 3,
                     offset: Offset(0, 3), // changes position of shadow
                   ),
                 ],
               ),
               child: Column(
                 children: [
                   GestureDetector(
                     onTap: (){
                         Navigator.push(context, GlobalFunction.route(LangSetting()));
                     },
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.all(Radius.circular(5)),
                                   color: Color(h.mainColor)
                               ),
                               padding: EdgeInsets.all(7),
                               child: ImageIcon(AssetImage("images/lang.png"),color: Colors.white,size: 18,),
                             ),
                             SizedBox(width: 8,),
                             CustomText.btnText(DemoLocalizations.of(context).title['language'], Colors.black54)
                           ],
                         ),
                         Icon(ParentPage.language=="en"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                       ],
                     ),
                   ),
                   Divider(color: Colors.black12,thickness: 1,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Container(
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(5)),
                                 color: Color(h.mainColor)
                             ),
                             padding: EdgeInsets.all(7),
                             child:Icon(Icons.notifications_none,color: Colors.white,)
                           ),
                           SizedBox(width: 8,),
                           CustomText.btnText(DemoLocalizations.of(context).title['notificationsound'], Colors.black54)
                         ],
                       ),
                      Switch(value: notifiction,activeColor: Color(h.mainColor), onChanged: (val){setState(() {
                        notifiction=true;
                      });})
                     ],
                   ),

                 ],
               ),
             ),

             SizedBox(height: MediaQuery.of(context).size.height*.02,),
             Expanded(child: SizedBox()),
             Container(child: Image.asset("images/logo.png",color: Color(h.mainColor).withOpacity(.1),
             height: MediaQuery.of(context).size.height*.35,
               fit: BoxFit.cover,
             )),
             SizedBox(height: MediaQuery.of(context).size.height*.1,)



           ],
         ),
       ),
     ),
   );
  }
}