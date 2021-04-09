import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'CustomSearch.dart';
import 'CustomText.dart';

class Notifications extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<Notifications>{
  Home h=new Home();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/background.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.08,),
          CustomSearch(),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          Container(
            width: MediaQuery.of(context).size.width*.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                  ImageIcon(AssetImage("images/notification.png"),color: Color(h.mainColor),),
                    SizedBox(width: 5,),
                    CustomText.titleTextColor("الاشعارات",Color(h.mainColor)),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    //Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top:10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ImageIcon(AssetImage("images/IconBack.png"),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black12,thickness: 1,),
          SizedBox(height: MediaQuery.of(context).size.height*.01,),
          Expanded(child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 21,itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.05,
                right:  MediaQuery.of(context).size.width*.05,
                bottom: MediaQuery.of(context).size.height*.01
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.03,
                  right:  MediaQuery.of(context).size.width*.03,
                top: MediaQuery.of(context).size.height*.01,
                bottom:  MediaQuery.of(context).size.height*.01
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black12,width: 1),
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
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: Colors.white,width: 2),
                      color: Color(0xffebfffc),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    child:  ImageIcon(AssetImage("images/notification.png"),size: 40,color: Color(h.mainColor),),
                  ),
                  SizedBox(width: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                         width: MediaQuery.of(context).size.width*.62,
                         child: CustomText.text12Bold("تم انشاء طلبك بنجاح.. سيتم التوصيل اليك في الموعد المحدد", Colors.black54)),
                     CustomText.text12Bold("منذ دقيقة", Color(h.mainColor))
                   ],
                 )
                ],
              ),
            );
          }))
        ],
      ),
    ),
  );
  }
}