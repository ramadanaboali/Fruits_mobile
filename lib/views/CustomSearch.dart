import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/utils/app_Localization.dart';

import '../main.dart';

class CustomSearch extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<CustomSearch>{
  Home h=new Home();
  TextEditingController SearchKey=new  TextEditingController();
  @override
  Widget build(BuildContext context) {
     return  Container(
       width: MediaQuery.of(context).size.width*.9,
       height: MediaQuery.of(context).size.height*.06,
       decoration: BoxDecoration(
         borderRadius:BorderRadius.all(Radius.circular(10)),
         border: Border.all(color: Colors.black12,width: 1),
         color: Colors.white,
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.1),
             spreadRadius: 3,
             blurRadius: 3,
             offset: Offset(0, 3), // changes position of shadow
           ),
         ],
       ),
       child: TextFormField(

         keyboardType: TextInputType.text,
         style: TextStyle(fontSize: 12),
         //textDirection: lang=="ar"?TextDirection.rtl:TextDirection.ltr,
         decoration: InputDecoration(
           contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
           enabledBorder: new OutlineInputBorder(
               borderRadius: BorderRadius.circular(30),
               borderSide: BorderSide(color: Colors.white)
           ),
           focusedBorder:  new OutlineInputBorder(
               borderRadius: BorderRadius.circular(30),
               borderSide: BorderSide(color: Colors.white)
           ),
           focusedErrorBorder:new OutlineInputBorder(
               borderRadius: BorderRadius.circular(30),
               borderSide: BorderSide(color: Colors.white)
           ),
           errorBorder:new OutlineInputBorder(
               borderRadius: BorderRadius.circular(30),
               borderSide: BorderSide(color: Colors.white)
           ),
           hintText: DemoLocalizations.of(context).title["search"] ,
           hintStyle: TextStyle(fontSize: 12,color: Colors.black38),
           prefixIcon:Container(
               width: 30,
               height: MediaQuery.of(context).size.height*.06,
               margin: EdgeInsets.all(2),
               alignment: Alignment.center,
               padding: EdgeInsets.all(2),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: Color(h.mainColor)
               ),
               child: Icon(Icons.search,color: Colors.white,size: 25,)),
           suffixIconConstraints: BoxConstraints(
               maxHeight: 50,
               minHeight: 30,
               maxWidth: 40,
               minWidth: 30
           ) ,
         ),
         controller: SearchKey,
       ),
     );
  }

}
