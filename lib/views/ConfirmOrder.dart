import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/DbHelper.dart';
import 'package:fruits/Model/AddressModel.dart';
import 'package:fruits/Services/ProductServices.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomText.dart';
import 'OrderSuccess.dart';

import '../main.dart';
import 'CustomSearch.dart';
import 'GlobalFunction.dart';

class ConfirmOrder extends StatefulWidget{
  List Items=[];
  String paymentMethod;
  AddressDetail address;
  String Time;
  ConfirmOrder( List Items,String paymentMethod, AddressDetail address,  String Time){
    this.Items=Items;
    this.paymentMethod=paymentMethod;
    this.address=address;
    this.Time=Time;
  }
  @override
  State<StatefulWidget> createState() {
    return _state( this.Items, this.paymentMethod,  this.address, this.Time);
  }
}
class _state extends State<ConfirmOrder>{
  Home h=new Home();
  List Items=[];
  DbHelper dbHelper=new DbHelper();
  String paymentMethod;
  AddressDetail address;
  String Time;
  _state( List Items,String paymentMethod, AddressDetail address,  String Time){
    this.Items=Items;
    this.paymentMethod=paymentMethod;
    this.address=address;
    this.Time=Time;
  }
  ProductServices productServices=new ProductServices();
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
                      CustomText.titleTextColor(DemoLocalizations.of(context).title['confirmOrder'],Color(h.mainColor)),
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
                          ParentPage.language=="ar"?ImageIcon(AssetImage("images/IconBack.png"),):Icon(Icons.arrow_forward_rounded,size: 30,),
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
                      CustomText.btnText(DemoLocalizations.of(context).title['orders'], Colors.black54),
                      CustomText.btnText("${Items.length} ${DemoLocalizations.of(context).title['orders']}", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText(DemoLocalizations.of(context).title['tax'], Colors.black54),
                      CustomText.btnText("0 ${DemoLocalizations.of(context).title['sr']}", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText(DemoLocalizations.of(context).title['discound'], Colors.black54),
                      CustomText.btnText("0 ${DemoLocalizations.of(context).title['sr']}", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText(DemoLocalizations.of(context).title['DeliveryCharge'], Colors.black54),
                      CustomText.btnText("0 ${DemoLocalizations.of(context).title['sr']}", Color(h.mainColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.btnText(DemoLocalizations.of(context).title['total'], Colors.black54),
                      CustomText.btnText("${ParentPage.TotalPrice} ${DemoLocalizations.of(context).title['sr']}", Color(h.mainColor)),
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
                          SizedBox(height: 10,),
                          CustomText.text12Bold(address.address, Colors.black),
                          SizedBox(height: 10,),
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(child: Text(DemoLocalizations.of(context).title['changeaddress'],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black,decoration: TextDecoration.underline),)))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            GestureDetector(
              onTap: () async {
                SharedPreferences prefs=await SharedPreferences.getInstance();
                Map<String,dynamic>data=await productServices.addOrders(prefs.getString("Token"),prefs.getString("lang"), prefs.getString("UserId"), double.parse(prefs.getString("price")), address.id, this.Items,this.paymentMethod,this.Time);
                print(data);
                print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
                if(data["status"]==200){
                  Navigator.push(context, GlobalFunction.route(OrderSucess()));
                  ParentPage.TotalPrice=0.0;
                  int i= await dbHelper.deleteCart();
                  setState(() {
                    prefs.setString("price", "0.0");
                  });
                  print(i.toString()+"     00000000000000000000000000000000000000000000000000000000000");
                }

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
                      CustomText.btnText(DemoLocalizations.of(context).title['confirm'], Colors.white),
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