import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    CustomText.titleTextColor("مركز المساعدة",Colors.black),
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
                            CustomText.btnText("رقم الهاتف", Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold("7816186252236", Colors.black38),

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
                            CustomText.btnText("البريد الالكتروني", Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold("asd@mail.com", Colors.black38),

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
                            CustomText.btnText("فيسبوك", Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold("fruit@faceBook.com", Colors.black38),

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
                            CustomText.btnText("تويتر", Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold("fruite@twitter.com", Colors.black38),

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
                            CustomText.btnText("سناب شات", Colors.black54)
                          ],
                        ),
                        CustomText.text12Bold("fruite@snapchat.com", Colors.black38),

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