import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomSearch.dart';

import '../main.dart';
import 'ConfirmOrder.dart';
import 'CustomText.dart';
import 'GlobalFunction.dart';

class Address extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Address>{
  Home h=new Home();
  var address="address";
  var payment;
  var time;
  List times=[
    "من 12 مساءا الي 4 مساءا"
    ,"من 4 مساءا الي 9 مساءا",
    "من 9 مساءا الي 12 صباحا",
    "من 1صباحا الي 5 صباحا",
    "من 6 صباحا الي 11 صباحا"
    ];
  var day="thursday";
  TextEditingController code=new  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: Container(
          child:Column(
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
                        ImageIcon(AssetImage("images/shoppingCard.png"),color: Color(h.mainColor),),
                        SizedBox(width: 5,),
                        CustomText.titleTextColor("عنوان التوصيل",Color(h.mainColor)),
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
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.9,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Radio(value: "address",groupValue: address,onChanged: (val){setState(() {
                                address="address";
                              });},activeColor: Color(h.mainColor),),
                              Container(
                                width: MediaQuery.of(context).size.width*.76,
                                height: MediaQuery.of(context).size.height*.065,
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.all(Radius.circular(10)),
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

                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (value){
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  validator: (value){
                                    if(value.isEmpty){
                                      return '';
                                    }
                                    return null;
                                  },
                                  //textDirection: lang=="ar"?TextDirection.rtl:TextDirection.ltr,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                    enabledBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    focusedBorder:  new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    focusedErrorBorder:new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.white)
                                    ),
                                    errorBorder:new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.red)
                                    ),
                                    hintText:'حي المحمدي',
                                    errorStyle: TextStyle(fontSize: 0),
                                    hintStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 12),
                                  ),
                                  controller: code,
                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Radio(value: "address",groupValue: address,onChanged: (val){setState(() {
                                address="address";
                              });},activeColor: Colors.white,),
                              Container(
                                width: MediaQuery.of(context).size.width*.75,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("اضافة عنوان اخر",style: TextStyle(decoration: TextDecoration.underline),),
                                    ImageIcon(AssetImage("images/mapLocator.png"))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
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
                          children: [
                            CustomText.btnText("طريقة الدفع", Colors.white),
                          ],
                        )
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.01,),
                    Container(
                        width: MediaQuery.of(context).size.width*.9,
                        padding: EdgeInsets.only(
                          //left: MediaQuery.of(context).size.width
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  payment="visa";
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height*.06,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(value: "visa",groupValue: payment,onChanged: (val){setState(() {
                                          payment=val;
                                        });},activeColor: Color(h.mainColor),),
                                        CustomText.text12Bold("دفع مدي-اونلاين", payment=="visa"?Color(h.mainColor):Colors.black54),
                                      ],
                                    ),
                                    Image.asset("images/visa.png",width: 50,height: 20,color: payment=="visa"?Color(h.mainColor):Colors.black54,)

                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  payment="cash";
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height*.06,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(value: "cash",groupValue: payment,onChanged: (val){setState(() {
                                          payment=val;
                                        });},activeColor: Color(h.mainColor),),
                                        CustomText.text12Bold("الدفع عند الاستلام -كاش", payment=="cash"?Color(h.mainColor):Colors.black54),
                                      ],
                                    ),
                                    Image.asset("images/cash.png",width: 50,height: 20,color: payment=="cash"?Color(h.mainColor):Colors.black54,)

                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  payment="mada";
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height*.06,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(value: "mada",groupValue: payment,onChanged: (val){setState(() {
                                          payment=val;
                                        });},activeColor: Color(h.mainColor),),
                                        CustomText.text12Bold("الدفع عند الاستلام- مدي", payment=="mada"?Color(h.mainColor):Colors.black54),
                                      ],
                                    ),
                                    Image.asset("images/visa.png",width: 50,height: 20,color: payment=="mada"?Color(h.mainColor):Colors.black54,)

                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.01,),
                    Container(
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
                          children: [
                            CustomText.btnText("موعد التوصيل", Colors.white),
                          ],
                        )
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  day="thursday";
                                });
                              },
                              child: Text("الخميس",style: TextStyle(color: day=="thursday"?Color(h.mainColor):Colors.black54,decoration: TextDecoration.underline),)),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  day="friday";
                                });
                              },
                              child: Text("الجمعة",style: TextStyle(color: day=="friday"?Color(h.mainColor):Colors.black54,decoration: TextDecoration.underline),)),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  day="saterday";
                                });
                              },
                              child: Text("السبت",style: TextStyle(color: day=="saterday"?Color(h.mainColor):Colors.black54,decoration: TextDecoration.underline),)),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*.9,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: times.length,itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              time=times[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5,bottom: 5),
                            child: Row(
                              children: [
                                Icon(Icons.access_time_rounded,color: time==times[index]?Color(h.mainColor):Colors.black54,),
                                SizedBox(width: 5,),
                                CustomText.text12Bold(times[index], time==times[index]?Color(h.mainColor):Colors.black54,)
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*.015,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, GlobalFunction.route(ConfirmOrder()));
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
                              CustomText.btnText("تأكيد الطلب", Colors.white),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  ],
                ),
              ),
            )


            ],
          ),
        ),
      ),
    );
  }
}