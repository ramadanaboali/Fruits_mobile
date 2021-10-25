import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Model/PaymentModel.dart';
import 'package:fruits/Services/AddressServices.dart';
import 'package:fruits/main.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:fruits/views/CustomText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethod extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<PaymentMethod>{
  Home h=new Home();
  List<PaymentDetail>paymentList;
  AddressServices addressServices =new AddressServices();
  loadData()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    paymentList=await addressServices.GetPayment(pref.getString("lang"),pref.getString("Token"));
    setState(() {
    });
    print(paymentList.length);
    print("00000000000000000000000000000000000000000");
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
      body: paymentList==null?Center(
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
                    CustomText.titleTextColor(DemoLocalizations.of(context).title['paymentmethod'],Colors.black),
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
              paymentList==null?Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
                  :
              Container(
                  width: MediaQuery.of(context).size.width*.9,
                  padding: EdgeInsets.only(
                    //left: MediaQuery.of(context).size.width
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
                  child: ListView.builder(
                      itemCount: paymentList.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return       GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width*.05,),
                                    CustomText.btnText(paymentList[index].name, Colors.black54),
                                  ],
                                ),
                                Image.asset("images/visa.png",width: 50,height: 20,color:Colors.black54,)

                              ],
                            ),
                          ),
                        );
                      })
              ),



            ],
          ),
        ),
      ),
    );
  }
}