import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'CustomText.dart';

class VerificationCode extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<VerificationCode>{
  Home h=new Home();
  final foemKey = GlobalKey<FormState>();
  TextEditingController n1=new TextEditingController();
  TextEditingController n2=new TextEditingController();
  TextEditingController n3=new TextEditingController();
  TextEditingController n4=new TextEditingController();

  final nod0 = FocusNode();
  final nod1 = FocusNode();
  final nod2 = FocusNode();
  final nod3 = FocusNode();

  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     body: SingleChildScrollView(
       child: Container(
         padding: EdgeInsets.only(
             left: MediaQuery.of(context).size.width*.035,
             right: MediaQuery.of(context).size.width*.035
         ),
         child: Column(
           children: [
             GestureDetector(
               onTap: (){
                 Navigator.pop(context);
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
             Image.asset("images/logo.png",
               height: MediaQuery.of(context).size.height*.25,
               fit: BoxFit.cover,
             ),
             CustomText.titleText("تأكيد التسجيل"),
             Container(
                 width: MediaQuery.of(context).size.width*.8,
                 child: CustomText.text12Bold("لقد قمنا بارسال اربع ارقام الي رقم هاتفك برسالة نصية من فضلك قم بادخالها للتاكيد",Colors.black54)),
             SizedBox(height: MediaQuery.of(context).size.height*.03,),
             Form(
               key: foemKey,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width * .125,

                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Colors.white,
                     ),
                     child: TextFormField(
                       autofocus: true,
                       focusNode: nod0,
                       maxLength: 1,
                       onChanged:(val) {
                         if(val.isEmpty){

                         }else
                           FocusScope.of(context).requestFocus(nod1);
                       },
                       //  onFieldSubmitted:
                       validator: (value) {
                         if (value.isEmpty) return 'Error';
                         return null;
                       },
                       textAlign: TextAlign.center,
                       style:  TextStyle(
                           fontSize: 18, fontWeight: FontWeight.bold,color: Color(h.mainColor)),
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         errorStyle: TextStyle(fontSize: 0),
                         contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                         enabledBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide:
                             BorderSide(color: Color(h.mainColor))),
                         focusedBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Color(h.mainColor))),
                         errorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                         focusedErrorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                         counterStyle: TextStyle(fontSize: 0),
                       ),
                       controller: n1,

                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width * .125,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Colors.white,
                     ),
                     child: TextFormField(
                       maxLength: 1,
                       onChanged: (val) {
                         if(val.isEmpty){
                           print("00000000000000000000000000000000");
                           FocusScope.of(context).requestFocus(nod0);
                         }else
                           FocusScope.of(context).requestFocus(nod2);
                       },
                       focusNode: nod1,
                       validator: (value) {
                         if (value.isEmpty) return 'Error';
                         return null;
                       },
                       textAlign: TextAlign.center,
                       style:  TextStyle(
                           fontSize: 18, fontWeight: FontWeight.bold,color: Color(h.mainColor)),
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         errorStyle: TextStyle(fontSize: 0),
                         counterStyle: TextStyle(fontSize: 0),
                         contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                         enabledBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide:
                             BorderSide(color: Color(h.mainColor))),
                         focusedBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Color(h.mainColor))),
                         errorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                         focusedErrorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                       ),
                       controller: n2,
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width * .125,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Colors.white,
                     ),
                     child: TextFormField(
                       maxLength: 1,
                       onChanged: (val) {
                         if(val.isEmpty){
                           FocusScope.of(context).requestFocus(nod1);
                         }else
                           FocusScope.of(context).requestFocus(nod3);
                       },
                       focusNode: nod2,
                       validator: (value) {
                         if (value.isEmpty) return 'Error';
                         return null;
                       },
                       textAlign: TextAlign.center,
                       style:  TextStyle(
                           fontSize: 18, fontWeight: FontWeight.bold,color: Color(h.mainColor)),
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         counterStyle: TextStyle(fontSize: 0),
                         errorStyle: TextStyle(fontSize: 0),
                         contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                         enabledBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide:
                             BorderSide(color: Color(h.mainColor))),
                         focusedBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Color(h.mainColor))),
                         errorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                         focusedErrorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                       ),
                       controller: n3,
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width * .125,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Colors.white,
                     ),
                     child: TextFormField(
                       maxLength: 1,
                       validator: (value) {
                         if (value.isEmpty) return 'Error';
                         return null;
                       },
                       focusNode: nod3,
                       onChanged: (val) {
                         if(val.isEmpty){
                           FocusScope.of(context).requestFocus(nod2);
                         }else
                           FocusScope.of(context).requestFocus(FocusNode());
                       },
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           fontSize: 18, fontWeight: FontWeight.bold,color: Color(h.mainColor)),
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         errorStyle: TextStyle(fontSize: 0),
                         counterStyle: TextStyle(fontSize: 0),
                         contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                         enabledBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide:
                             BorderSide(color: Color(h.mainColor))),
                         focusedBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Color(h.mainColor))),
                         errorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                         focusedErrorBorder: new OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                                 color: Colors.red)),
                       ),
                       controller: n4,
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*.03,),
             Container(
               width: MediaQuery.of(context).size.width,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("أعادة ارسال الرمز خلال ",style: TextStyle(decoration: TextDecoration.underline,color: Color(h.mainColor),fontSize: 12,fontWeight: FontWeight.bold),)
                   ,CustomText.text12("00:32 ثانية"),
                 ],
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*.03,),
             GestureDetector(
          onTap: (){
                 if(foemKey.currentState.validate()){
                   Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
                 }
                 else{
                   setState(() {

                   });
                 }
               },
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height*.065,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     color: Color(h.mainColor)
                 ),
                 child: CustomText.btnText("تأكيد الرمز", Colors.white),
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height*.03,),
           ],
         ),
       ),
     ),
   ));
  }
}