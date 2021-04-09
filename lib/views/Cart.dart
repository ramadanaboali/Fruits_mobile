import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Model/CartLocalModel.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DbHelper.dart';
import 'Address.dart';
import 'ConfirmOrder.dart';
import 'CustomSearch.dart';

import '../main.dart';
import 'CustomText.dart';
import 'GlobalFunction.dart';

class Cart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Cart>{
  Home h=new Home();
  TextEditingController code=new  TextEditingController();
  List dataLocal=[];
  DbHelper db=new DbHelper();
  loadData() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    dataLocal=await db.allProduct();
    setState(() {
    });
    print(dataLocal.length.toString());
    print("ssssssssssssssssssssss");
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
          image: DecorationImage(image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
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
                        CustomText.titleTextColor("السلة",Color(h.mainColor)),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        //Navigator.pop(context);
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
              Container(
                child: FutureBuilder(
                    future: db.allProduct(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                            height: MediaQuery.of(context).size.height*.3,
                            child: Center(child: CircularProgressIndicator()));
                      }
                      else{
                        return snapshot.data.length==0?
                        Container(
                            padding:EdgeInsets.only(top:MediaQuery.of(context).size.height*0),child: Center(
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                                  child: Image.asset("images/logo.png",color: Color(h.mainColor),
                                    height: MediaQuery.of(context).size.height*.25,
                                  )),
                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Text("لا يوجد منتجات في السلة",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black26),),
                              SizedBox(height: MediaQuery.of(context).size.height*.035,),

                            ],
                          ),
                        )):
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*.05,
                              right: MediaQuery.of(context).size.width*.05,
                            ),
                            primary: false,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context,index){
                          CartMedelLocal c=new CartMedelLocal.fromMap(snapshot.data[index]);
                          return Container(
                            height: MediaQuery.of(context).size.height*.12,
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height*.01,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.black12,width: 1)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width*.25,
                                      height: MediaQuery.of(context).size.height*.12,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: Color(0xffebfffc)
                                      ),
                                      child: Image.network(GlobalVariable.URL+c.img,fit: BoxFit.cover,),


                                    ),
                                    SizedBox(width: 8,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText.btnText(c.name, Colors.black87),
                                        Row(
                                          children: [
                                            CustomText.text12Bold("${c.price} ريال ", Color(h.mainColor)),
                                            CustomText.text12Bold(" \\ للكيلو ", Colors.black54)
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5,right: 5),
                                  width: MediaQuery.of(context).size.width*.25,
                                  height: MediaQuery.of(context).size.height*.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Color(h.mainColor)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          CartMedelLocal cartLDBModel = CartMedelLocal({
                                            'id':c.id,
                                            'name': c.name,
                                            'img':  c.img,
                                            'price': c.price,
                                            'description':c.description,
                                            'quantity': c.quantity+1,

                                          });

                                          setState(() {
                                            db.updateCourse(cartLDBModel);
                                          });
                                        },
                                        child: Container(
                                            padding:EdgeInsets.all(3),
                                            child: Icon(Icons.add,color: Colors.white,size: 22,)),
                                      ),
                                      CustomText.btnText(c.quantity.toString(),Colors.white),
                                      GestureDetector(
                                        onTap: (){
                                          CartMedelLocal cartLDBModel = CartMedelLocal({
                                            'id':c.id,
                                            'name': c.name,
                                            'img':  c.img,
                                            'price': c.price,
                                            'description':c.description,
                                            'quantity': c.quantity-1,

                                          });

                                          setState(() {
                                            db.updateCourse(cartLDBModel);
                                          });
                                        },
                                        child: Container(
                                            padding:EdgeInsets.all(3),
                                            child: Icon(Icons.remove,color: Colors.white,size: 22,)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                      }
                    }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.015,),
              GestureDetector(
                onTap: (){

                },
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    color: Color(h.mainColor),
                    strokeWidth: 1.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        width: MediaQuery.of(context).size.width*.9,
                        height: MediaQuery.of(context).size.height*.06,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //  border: Border.all(width: 1.0,color: Colors.black26),
                          color: Color(0xffddf8bf)
                        ),
                        child: CustomText.btnText("تهانينا .. لقد حصلت علي توصيل مجاني", Color(h.mainColor)),
                      ),
                    )

                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.015,),
             Container(
               width: MediaQuery.of(context).size.width*.9,
               height: MediaQuery.of(context).size.height*.09,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width*.6,
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
                         hintText:'كود الخصم الخاص بك',
                         errorStyle: TextStyle(fontSize: 0),
                         hintStyle: TextStyle(color: Color(h.mainColor),fontWeight: FontWeight.bold,fontSize: 12),
                       ),
                       controller: code,
                     ),
                   ),
                   Container(
                     height: MediaQuery.of(context).size.height*.065,
                     width: MediaQuery.of(context).size.width*.28,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Color(h.mainColor)
                     ),
                     alignment: Alignment.center,
                     child: CustomText.btnText("تطبيق", Colors.white),
                   )
                 ],
               ),
             ),
              SizedBox(height: MediaQuery.of(context).size.height*.015,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.btnText("المجموع", Color(h.mainColor)),
                        CustomText.btnText("100 ريال", Color(h.mainColor))
                      ],
                    ),
                    Divider(color: Colors.black12,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.btnText("رسوم التوصيل", Color(h.mainColor)),
                        CustomText.btnText("00 ريال", Color(h.mainColor))
                      ],
                    ),
                    Divider(color: Colors.black12,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.btnText("الاجمال شامل الضريبة", Colors.black),
                        CustomText.btnText("100 ريال", Colors.black)
                      ],
                    ),
                    Divider(color: Colors.black12,thickness: 1,)
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.015,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, GlobalFunction.route(Address()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*.065,
                  width: MediaQuery.of(context).size.width*.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(h.mainColor)
                  ),
                  alignment: Alignment.center,
                  child: CustomText.btnText("التاكيد والدفع", Colors.white),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.015,),


            ],
          ),
        ),
      ),
    );
  }
}