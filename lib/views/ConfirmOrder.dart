import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomText.dart';
import 'OrderSuccess.dart';

import '../main.dart';
import 'CustomSearch.dart';
import 'GlobalFunction.dart';

class ConfirmOrder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<ConfirmOrder>{
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
                      Icon(Icons.check,color: Color(h.mainColor),size: 35,),
                      SizedBox(width: 5,),
                      CustomText.titleTextColor("تأكيد الطلب",Color(h.mainColor)),
                    ],
                  ),
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
            Divider(color: Colors.black12,thickness: 1,),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            Container(
              width: MediaQuery.of(context).size.width*.9,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText("سلة الطلبات", Colors.black54),
                      CustomText.btnText("3 طلبات", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText("الضرايب", Colors.black54),
                      CustomText.btnText("0 ريال", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText("الخصم", Colors.black54),
                      CustomText.btnText("3 ريال", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText("تكلفة التوصيل", Colors.black54),
                      CustomText.btnText("5 ريال", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText("الاجمالي", Colors.black54),
                      CustomText.btnText("22 ريال", Color(h.mainColor)),
                    ],
                  ),


                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            Container(
              width: MediaQuery.of(context).size.width*.9,

              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffebfffc),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*.02,
                bottom: MediaQuery.of(context).size.height*.02,
                left: MediaQuery.of(context).size.width*.05,
                right: MediaQuery.of(context).size.width*.05
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              color: Color(h.mainColor)
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                color: Color(h.mainColor)
                            ),
                          ),

                        ],
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.text12Bold("مكة -شارع الملك سلطان", Colors.black),
                          CustomText.text12Bold("عمارة رقم 2.. شقة رقم 11", Colors.black54),
                          SizedBox(height: 5,),
                          Text("تغير العنوان",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black,decoration: TextDecoration.underline),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, GlobalFunction.route(OrderSucess()));
              },
              child: Container(
                  height: MediaQuery.of(context).size.height*.065,
                  width: MediaQuery.of(context).size.width*.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(h.mainColor)
                  ),
                  padding: EdgeInsets.only(
                      left: 15,right: 15
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText.btnText("التاكيد", Colors.white),
                    ],
                  )
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.015,),
          ],
        ),
      ),
    );
  }
}