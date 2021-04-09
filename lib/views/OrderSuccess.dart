import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomText.dart';

import '../main.dart';

class OrderSucess extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<OrderSucess>{
  Home h=new Home();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       color: Colors.black,
       child: Container(
         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.15,bottom:MediaQuery.of(context).size.height*.15),
         height: MediaQuery.of(context).size.height*.7,
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(30)),
           color: Colors.white
         ),
         child: Column(
           children: [
             SizedBox(height: MediaQuery.of(context).size.height*.01,),
             Text("طلب ناجح",style: TextStyle(fontSize: 50,color: Color(h.mainColor),fontWeight: FontWeight.bold,shadows:
             <Shadow>[
               Shadow(
                 offset: Offset(3, 3),
                 blurRadius: 2.0,
                 color: Colors.black,
               ),

             ],
             ),),
             SizedBox(height: MediaQuery.of(context).size.height*.025,),
             Container(
                 width: MediaQuery.of(context).size.width*.9,

                 child: CustomText.btnText("طلبك قيد التجهيز والتوصيل باسرع وقت يمكنك تفقد طلباتك الحالية او متابعة التسوق", Colors.black45)),
             SizedBox(height: MediaQuery.of(context).size.height*.025,),
             Container(
                 width: MediaQuery.of(context).size.width*.9,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     GestureDetector(
                       onTap: (){
                         Navigator.pushNamedAndRemoveUntil(context, "/Orders", (route) => false);
                       },
                       child: Container(
                         height: MediaQuery.of(context).size.height*.065,
                         width: MediaQuery.of(context).size.width*.43,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Color(h.mainColor)
                         ),
                         alignment: Alignment.center,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.bookmark_border,color: Colors.white,size: 22,),
                             SizedBox(width: 3,),
                             CustomText.btnText14("طلباتي", Colors.white)
                           ],
                         ),
                       ),
                     ),
                     GestureDetector(
                       onTap: (){
                         Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
                       },
                       child: Container(
                         height: MediaQuery.of(context).size.height*.065,
                         width: MediaQuery.of(context).size.width*.43,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             color: Color(h.mainColor)
                         ),
                         alignment: Alignment.center,
                         child:Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             ImageIcon(AssetImage("images/shoppingCard.png"),color: Colors.white,size: 22,),
                             SizedBox(width: 3,),
                             CustomText.btnText14("متابعة التسوق", Colors.white),
                           ],
                         )

                       ),
                     ),

                   ],
                 )
                 ),
             Expanded(
               child: Image.asset("images/logo.png",
               color: Color(h.mainColor).withOpacity(.3),
               ),
             )

           ],
         ),
       )
     ),
   );
  }
}
