import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Model/CartLocalModel.dart';
import '../Model/ProductModel.dart';
import '../main.dart';
import 'CustomText.dart';
import 'HomePage.dart';
import 'MainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fruits/Model/CartLocalModel.dart';
import 'GlobalFunction.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import '../DbHelper.dart';

class CategoryProduct extends StatefulWidget{
  List<ProductDetail>data;
  String title;
  CategoryProduct(List<ProductDetail>data,String title){
    this.data=data;
    this.title=title;
  }
  @override
  State<StatefulWidget> createState() {
    return _state(this.data,this.title);
  }
}
class _state extends State<CategoryProduct>{
  List<ProductDetail>data;
  String title;
  DbHelper dbHelper=new DbHelper();
  _state(List<ProductDetail>data,String title){
    this.data=data;
    this.title=title;
  }
  Home h=new Home();
  TextEditingController SearchKey=new  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child:Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.07,),
                  Container(
                    width: MediaQuery.of(context).size.width*.9,
                    height: MediaQuery.of(context).size.height*.06,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black12,width: 1),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
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
                        hintText:'ما الذي تبحث عنه' ,
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
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Container(
                    width: MediaQuery.of(context).size.width*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.titleText(this.title),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
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
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                  Expanded(child: GridView.builder(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05
                    ),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: MediaQuery.of(context).size.width*.05,
                        childAspectRatio: 1/1.14
                    ),
                    itemBuilder: (context,index){
                      return Container(
                        height: MediaQuery.of(context).size.height*.255,
                        width: MediaQuery.of(context).size.width*.4,
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black12.withOpacity(.05),width: 1),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.05),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                          //left: MediaQuery.of(context).size.width*.05
                        ),
                        child: Column(
                          children: [
                            Image.network(GlobalVariable.URL+data[index].coverPhoto,
                              height: MediaQuery.of(context).size.height*.1,
                              width: MediaQuery.of(context).size.width*.38,
                              fit: BoxFit.fill,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 10,right: 10
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText.btnText(data[index].name, Colors.black),
                                      Row(
                                        children: [
                                          CustomText.text12Bold(data[index].price.toString()+" ريال ", Color(h.mainColor)),
                                          CustomText.text12Bold("للكيلو", Colors.black54)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height*.115,
                                  width: MediaQuery.of(context).size.height*.035,
                                  decoration: BoxDecoration(
                                      color: Color(h.mainColor),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15))
                                  ),
                                  padding: EdgeInsets.only(top: 2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            data[index].counter= data[index].counter+1;
                                          });
                                        },
                                        child:Container(
                                            padding: EdgeInsets.all(2),
                                            child: Icon(Icons.add,color: Colors.white,size: 20,)),
                                      ),
                                      CustomText.text12Bold(data[index].counter.toString(), Colors.white),
                                      GestureDetector(
                                        onTap: (){
                                          if(data[index].counter>1){
                                            setState(() {
                                              data[index].counter= data[index].counter-1;
                                            });
                                          }
                                        },
                                        child:Container(
                                            padding: EdgeInsets.all(2),
                                            child: Icon(Icons.remove,color: Colors.white,size: 20,)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            GestureDetector(
                              onTap: () async {
                                SharedPreferences prefs=await SharedPreferences.getInstance();
                                double totalPrice=prefs.getString("price")==null?0.0:double.parse(prefs.getString("price"));
                                CartMedelLocal p1=new CartMedelLocal({
                                  "id":data[index].id,
                                  "name":data[index].name,
                                  "img":data[index].coverPhoto,
                                  "description":data[index].description,
                                  "price":double.parse(data[index].price.toString()),
                                  "totalPrice":double.parse((data[index].counter*data[index].price).toString()),
                                  "quantity":data[index].counter
                                });
                                try
                                {
                                  GlobalFunction.UpdateTotalPrices(double.parse((data[index].counter*data[index].price).toString()));
                                  await dbHelper.addToCart(p1);
                                  GlobalFunction.addProductDialog(context,data[index].counter,data[index].name,);
                                  setState(() {
                                    ParentPage.TotalPrice= double.parse(prefs.getString("price"));
                                  });
                                }
                                catch(e)
                                {
                                  GlobalFunction.addedBeforeDialog(context);

                                }},
                              child: Container(
                                height: MediaQuery.of(context).size.height*.035,
                                width: MediaQuery.of(context).size.width*.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft:  Radius.circular(5)),
                                    color: Color(h.mainColor)
                                ),
                                alignment: Alignment.center,
                                child: CustomText.text12Bold("اضف للسلة", Colors.white),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                  )
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height*.84,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.05,
                    right: MediaQuery.of(context).size.width*.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.43,
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText.text12Bold(ParentPage.TotalPrice==null?"00 رس ":"${ParentPage.TotalPrice}رس ", Colors.black),
                            //SizedBox(width: 2,),
                           // CustomText.text12Bold("شامل الضريبة", Colors.black54)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, GlobalFunction.route(HomePage(2)));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.43,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color(h.mainColor)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(AssetImage("images/shoppingCard.png"),color: Colors.white,),
                              CustomText.btnText("سلة التسوق", Colors.white)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}