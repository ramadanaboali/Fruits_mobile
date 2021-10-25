import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Services/ConfigServices.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'CustomText.dart';

class AboutApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AboutApp> {
  Home h = new Home();
   ConfigServices configServices=new ConfigServices();
   Map<String,dynamic>data;
   loadData() async {
     SharedPreferences pref=await SharedPreferences.getInstance();
     data=await configServices.getSetting(pref.getString("lang"));
     setState(() {
     });
     print(data);
     print("sssssssssssssssssssssssssssssssssssssssssssssss");
   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
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
                    CustomText.titleTextColor(DemoLocalizations.of(context).title['aboutus'],Colors.black),
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
              Image.asset("images/logo.png",color: Color(h.mainColor),
                height: MediaQuery.of(context).size.height*.2,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.text12Bold("تطبيق فروتس", Colors.black),
                    SizedBox(width: 5,),
                    CustomText.text12Bold(data["data"]["version"], Color(h.mainColor)),
                  ],
                ),
              ),
              data==null?Expanded(child:Center(child: CircularProgressIndicator(),)):
              Expanded(child: Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*.9,
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.2),
                        child: Image.asset("images/logo.png",color: Color(h.mainColor).withOpacity(.15),
                        height: MediaQuery.of(context).size.height*.4,)),
                    CustomText.text12Boldcenter(data["data"]["aboutUs"],Colors.black45),
                  ],
                )
              )),





            ],
          ),
        ),
      ),
    );
  }
}