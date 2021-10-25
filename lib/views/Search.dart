import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Model/CartLocalModel.dart';
import 'package:fruits/Model/CategoryModel.dart';
import 'package:fruits/Model/ProductModel.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import 'package:fruits/Services/ProductServices.dart';
import 'package:fruits/views/CategoryProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DbHelper.dart';
import '../main.dart';
import 'CustomText.dart';
import 'GlobalFunction.dart';
import 'HomePage.dart';
import '../Model/SearchModel.dart';

class Search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<Search>{
  TextEditingController SearchKey=new  TextEditingController();
  Home h=new Home();
  List categoriesList;
  List ProductList;
  List<ProductDetail>ProductsCategory;
  DbHelper dbHelper=new DbHelper();
  Map <String,dynamic>responce;
  ProductServices productServices=new ProductServices();
  search(var key)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
   ProductList=await productServices.SearchProduct(prefs.getString("lang"), key);
   categoriesList=await productServices.SearchCategory(prefs.getString("lang"), key);
   setState(() {
   });

    print(ProductList.length);
    print(categoriesList.length);
    print("ssssssssssssssssss");
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: Stack(
       children: [
         Container(
           height: MediaQuery.of(context).size.height,
           child: SingleChildScrollView(
               child:  Container(
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.only(
                     top: MediaQuery.of(context).size.height*.05
                 ),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(30),topRight: Radius.circular(30)
                     ),
                     color: Colors.white
                 ),
                 child: Column(
                   children: [
                     SizedBox(height: MediaQuery.of(context).size.height*.015,),
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
                         onChanged: (val){
                           search(val);
                         },
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
                     SizedBox(height: MediaQuery.of(context).size.height*.02,),
                     Container(
                       width: MediaQuery.of(context).size.width*.9,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             children: [
                               Icon(Icons.search,color: Color(h.mainColor),size: 35,),
                               SizedBox(width: 5,),
                               CustomText.titleTextColor("البحث",Color(h.mainColor)),
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
                    categoriesList==null&&ProductList==null? Container(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*.05,),
                          Image.asset("images/logo.png",
                          height: MediaQuery.of(context).size.height*.25,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.02,),
                          CustomText.text12Bold("يمكنك البحث عن الاصناف والمنتجات ", Colors.black54),
                        ],
                      ),
                    ):
                    Column(
                       children: [
                        categoriesList.length==0?SizedBox(): Column(
                           children: [
                             SizedBox(height: MediaQuery.of(context).size.height*.02,),
                             Container(
                               width: MediaQuery.of(context).size.width*.9,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       SizedBox(width: 5,),
                                       CustomText.titleTextColor("الاصناف",Color(h.mainColor)),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Container(
                               child: GridView.builder(
                                 padding: EdgeInsets.only(
                                     left: MediaQuery.of(context).size.width*.05,
                                     right: MediaQuery.of(context).size.width*.05
                                 ),
                                 primary: false,
                                 shrinkWrap: true,
                                 itemCount: categoriesList.length,
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 4,
                                     mainAxisSpacing: 10,
                                     crossAxisSpacing: 10,
                                     childAspectRatio: 1/1.4
                                 ),
                                 itemBuilder: (context,index){
                                   return GestureDetector(
                                     onTap: ()async{
                                       SharedPreferences prefs=await SharedPreferences.getInstance();
                                       ProductsCategory=await productServices.CatCategoryProduct(prefs.getString("lang"), categoriesList[index].id);
                                       Navigator.push(context, GlobalFunction.route(CategoryProduct(ProductsCategory,categoriesList[index].name)));
                                     },
                                     child: Container(
                                       child: Column(
                                         children: [
                                           Container(
                                             width: MediaQuery.of(context).size.width*.18,
                                             height: MediaQuery.of(context).size.height*.1,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.all(Radius.circular(10)),color: Color(h.mainColor)
                                             ),
                                             padding: EdgeInsets.all(8),
                                             child: Image.network(GlobalVariable.URL+categoriesList[index].photo),
                                           ),
                                           SizedBox(height: 3,),
                                           CustomText.text12Bold(categoriesList[index].name, Colors.black54),
                                         ],
                                       ),
                                     ),
                                   );
                                 },
                               ),
                             )
                           ],
                         ),
                         ProductList.length==0?SizedBox():Column(
                           children: [
                             SizedBox(height: MediaQuery.of(context).size.height*.02,),
                             Container(
                               width: MediaQuery.of(context).size.width*.9,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       SizedBox(width: 5,),
                                       CustomText.titleTextColor("المنتجات",Color(h.mainColor)),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Container(
                               child: GridView.builder(
                                 padding: EdgeInsets.only(
                                     left: MediaQuery.of(context).size.width*.05,
                                     right: MediaQuery.of(context).size.width*.05
                                 ),
                                 primary: false,
                                 shrinkWrap: true,
                                 itemCount: ProductList.length,
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
                                         Image.network(GlobalVariable.URL+ProductList[index].coverPhoto,
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
                                                   CustomText.btnText(ProductList[index].name, Colors.black),
                                                   Row(
                                                     children: [
                                                       CustomText.text12Bold(ProductList[index].price.toString()+" ريال ", Color(h.mainColor)),
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
                                                         ProductList[index].counter= ProductList[index].counter+1;
                                                       });
                                                     },
                                                     child:Container(
                                                         padding: EdgeInsets.all(2),
                                                         child: Icon(Icons.add,color: Colors.white,size: 20,)),
                                                   ),
                                                   CustomText.text12Bold(ProductList[index].counter.toString(), Colors.white),
                                                   GestureDetector(
                                                     onTap: (){
                                                       if(ProductList[index].counter>1){
                                                         setState(() {
                                                           ProductList[index].counter= ProductList[index].counter-1;
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
                                               "id":ProductList[index].id,
                                               "name":ProductList[index].name,
                                               "img":ProductList[index].coverPhoto,
                                               "description":ProductList[index].description,
                                               "price":double.parse(ProductList[index].price.toString()),
                                               "totalPrice":double.parse((ProductList[index].counter*ProductList[index].price).toString()),
                                               "quantity":ProductList[index].counter
                                             });
                                             try
                                             {
                                               GlobalFunction.UpdateTotalPrices(double.parse((ProductList[index].counter*ProductList[index].price).toString()));
                                               await dbHelper.addToCart(p1);
                                               GlobalFunction.addProductDialog(context,ProductList[index].counter,ProductList[index].name,);
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
                               ),
                             )
                           ],
                         ),
                       ],
                     )
                   ],
                 ),
               )
           ),
         ),
         Positioned(
             top: MediaQuery.of(context).size.height*.88,
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
                       //  SizedBox(width: 2,),
                       //  CustomText.text12Bold("شامل الضريبة", Colors.black54)
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
     )
   );
  }
}