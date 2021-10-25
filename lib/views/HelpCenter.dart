import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Services/ConfigServices.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'CustomText.dart';

class HelpCenter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<HelpCenter>{
  Home h=new Home();
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
      body: data==null?Center(
        child: CircularProgressIndicator(),
      ):Container(
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
                    CustomText.titleTextColor(DemoLocalizations.of(context).title['helpcenter'],Colors.black),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            CustomText.btnText(DemoLocalizations.of(context).title['phonenumber'], Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold("01000478589", Colors.black38),

                      ],
                    ),
                    Divider(color: Colors.black12,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            CustomText.btnText(DemoLocalizations.of(context).title['email'], Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold(data["data"]["mailLink"], Colors.black38),

                      ],
                    ),
                    Divider(color: Colors.black12,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            CustomText.btnText(DemoLocalizations.of(context).title['facebook'], Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold(data["data"]["facebookLink"], Colors.black38),

                      ],
                    ),
                    Divider(color: Colors.black12,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            CustomText.btnText(DemoLocalizations.of(context).title['twiter'], Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold(data["data"]["twitterLink"], Colors.black38),

                      ],
                    ),
                    Divider(color: Colors.black12,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            CustomText.btnText(DemoLocalizations.of(context).title['snapchat'], Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold(data["data"]["snapShotLink"], Colors.black38),

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
              SizedBox(height: MediaQuery.of(context).size.height*.05,)



            ],
          ),
        ),
      ),
    );
  }
}