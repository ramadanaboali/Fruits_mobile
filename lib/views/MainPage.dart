import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits/DbHelper.dart';
import 'package:fruits/Model/CartLocalModel.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import 'package:fruits/views/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Categories.dart';
import 'CategoryProduct.dart';
import '../Model/ProductModel.dart';
import '../Model/CategoryModel.dart';
import 'CustomText.dart';
import '../Services/ProductServices.dart';
import '../main.dart';
import 'GlobalFunction.dart';
import 'Search.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<MainPage>{
  ProductServices productServices=new ProductServices();
  Home h=new Home();
  TextEditingController SearchKey=new  TextEditingController();
  List<ProductDetail>advertmentsList=[];
  List<ProductDetail>bestSellerList=[];
  List<ProductDetail>offersList=[];
  List<ProductDetail>ProductsCategory=[];
  DbHelper dbHelper=new DbHelper();
  var lang;
  List <CategoryModelDetail>categoriesList=[];
  loadData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    advertmentsList=await productServices.GetAdvertisment(prefs.getString("lang"));
    bestSellerList=await productServices.GetBestSeller(prefs.getString("lang"));
    offersList=await productServices.GetOffers(prefs.getString("lang"));
    categoriesList=await productServices.CatAllCategory(prefs.getString("lang"));
    setState(() {
      lang=prefs.getString("lang");
    });
    print(advertmentsList.length);
    print(bestSellerList.length);
    print(offersList.length);
    print(categoriesList.length);
    print("ssssssssssssss");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
   return Stack(
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
                   GestureDetector(
                     onTap: (){
                       print("ssssssssssssssssssss");
                       Navigator.push(context, GlobalFunction.routeBottom(Search()));
                     },
                     child: Container(
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
                         enabled: false,
                         style: TextStyle(fontSize: 12),
                         //textDirection: lang=="ar"?TextDirection.rtl:TextDirection.ltr,
                         decoration: InputDecoration(
                           contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                           disabledBorder: new OutlineInputBorder(
                               borderRadius: BorderRadius.circular(30),
                               borderSide: BorderSide(color: Colors.white)
                           ),
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
                   ),
                   advertmentsList.length==0?Container(
                     height: MediaQuery.of(context).size.height*.18,
                     width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                   ):
                   Container(
                     height: MediaQuery.of(context).size.height*.18,
                     width: MediaQuery.of(context).size.width,
                     color: Colors.white,
                     child: Row(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height*.18,
                           width: MediaQuery.of(context).size.width,
                           child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: advertmentsList.length,itemBuilder: (context,index){
                             return Container(
                               width: MediaQuery.of(context).size.width*.63,
                               padding: EdgeInsets.only(
                                   left: MediaQuery.of(context).size.width*.05,
                                   right: MediaQuery.of(context).size.width*.05,
                                   top: MediaQuery.of(context).size.height*.01,
                                   bottom: MediaQuery.of(context).size.height*.01
                               ),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(10)),
                                 border: Border.all(color: Colors.black12.withOpacity(.05),width: 1),
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
                               margin: EdgeInsets.only(
                                   left: MediaQuery.of(context).size.width*.05,
                                   top:  MediaQuery.of(context).size.height*.015,
                                   bottom:  MediaQuery.of(context).size.height*.015
                               ),
                               child: Row(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                           width: MediaQuery.of(context).size.width*.4,
                                           child: Text(advertmentsList[index].name,style: TextStyle(height: 1.4,color: Color(h.mainColor),fontSize: 16,fontWeight: FontWeight.bold),)),
                                       Expanded(child: SizedBox()),
                                       GestureDetector(
                                         onTap: () async {
                                           SharedPreferences prefs=await SharedPreferences.getInstance();
                                           double totalPrice=prefs.getString("price")==null?0.0:double.parse(prefs.getString("price"));
                                           CartMedelLocal p1=new CartMedelLocal({
                                             "id":advertmentsList[index].id,
                                             "name":advertmentsList[index].name,
                                             "img":advertmentsList[index].coverPhoto,
                                             "description":advertmentsList[index].description,
                                             "price":double.parse(advertmentsList[index].price.toString()),
                                             "totalPrice":double.parse((advertmentsList[index].counter*advertmentsList[index].price).toString()),
                                             "quantity":advertmentsList[index].counter
                                           });
                                           try
                                           {
                                             GlobalFunction.UpdateTotalPrices(double.parse((advertmentsList[index].counter*advertmentsList[index].price).toString()));
                                             await dbHelper.addToCart(p1);
                                             GlobalFunction.addProductDialog(context,advertmentsList[index].counter,advertmentsList[index].name,);
                                             setState(() {
                                               ParentPage.TotalPrice= double.parse(prefs.getString("price"));
                                             });
                                           }
                                           catch(e)
                                           {
                                             GlobalFunction.addedBeforeDialog(context);

                                           }},
                                         child: Container(
                                           width: MediaQuery.of(context).size.width*.3,
                                           height: MediaQuery.of(context).size.height*.04,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.all(Radius.circular(5)),
                                               color: Color(h.mainColor)
                                           ),
                                           alignment: Alignment.center,
                                           child: CustomText.text12Bold("اضف للسلة", Colors.white),
                                         ),
                                       )
                                     ],
                                   ),
                                   Expanded(child: SizedBox()),
                                   Image.network(GlobalVariable.URL+advertmentsList[index].coverPhoto,
                                   width: MediaQuery.of(context).size.width*.12,
                                     fit: BoxFit.cover,
                                   )
                                 ],
                               ),
                             );
                           }),
                         )

                       ],
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.015,),
                   Container(
                     height: MediaQuery.of(context).size.height*.14,
                     width: MediaQuery.of(context).size.width,
                     color: Colors.white,
                     child: Row(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height*.14,
                           width: MediaQuery.of(context).size.width,
                           child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: categoriesList.length,itemBuilder: (context,index){
                             return Row(
                               children:[
                                 SizedBox(width: MediaQuery.of(context).size.width*.05,),
                                 GestureDetector(
                                   onTap: ()async{
                                     ProductsCategory=await productServices.CatCategoryProduct(lang, categoriesList[index].id);
                                     Navigator.push(context, GlobalFunction.route(CategoryProduct(ProductsCategory,"كل الاقسام")));
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
                                 ),
                                index==categoriesList.length-1? GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, GlobalFunction.route(Categories(categoriesList)));
                                  },
                                  child: Container(
                                     margin: EdgeInsets.only(
                                         left: MediaQuery.of(context).size.width*.05,
                                       right: MediaQuery.of(context).size.width*.05,
                                     ),
                                     child: Column(
                                       children: [
                                         Container(
                                           width: MediaQuery.of(context).size.width*.18,
                                           height: MediaQuery.of(context).size.height*.1,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.all(Radius.circular(10)),color: Color(h.mainColor)
                                           ),
                                           padding: EdgeInsets.all(8),
                                           child: Icon(Icons.arrow_forward_outlined,color: Colors.white,),
                                         ),
                                         SizedBox(height: 3,),
                                         CustomText.text12Bold("الكل ", Colors.black54),
                                       ],
                                     ),
                                   ),
                                ):SizedBox()
                               ],
                             );
                           }),
                         )

                       ],
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.00,),
                   Container(
                     width: MediaQuery.of(context).size.width*.9,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         CustomText.titleText("الاكثر طلبا"),
                     GestureDetector(
                      onTap: (){
                      Navigator.push(context, GlobalFunction.route(CategoryProduct(bestSellerList,"الاكثر طلبا")));
                      },
                       child: Text("عرض الكل",style: TextStyle(color: Color(h.mainColor),decoration: TextDecoration.underline),))
                       ],
                     ),
                   ),
                   Divider(color: Colors.black12,thickness: 1,),
                   SizedBox(height: MediaQuery.of(context).size.height*.005,),
                   bestSellerList.length==0?Container(
                     height: MediaQuery.of(context).size.height*.18,
                     width: MediaQuery.of(context).size.width,
                     child: Center(
                       child: CircularProgressIndicator(),
                     ),
                   ):
                   Container(
                     height: MediaQuery.of(context).size.height*.255,
                     width: MediaQuery.of(context).size.width,
                     color: Colors.white,
                     child: Row(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height*.255,
                           width: MediaQuery.of(context).size.width,
                           child: ListView.builder(scrollDirection: Axis.horizontal,itemCount:bestSellerList.length ,itemBuilder: (context,index){
                             return Row(
                               children: [
                                 SizedBox(width: MediaQuery.of(context).size.width*.05,),
                                 Container(
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
                                       Image.network(GlobalVariable.URL+bestSellerList[index].coverPhoto,
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
                                                 CustomText.btnText(bestSellerList[index].name, Colors.black),
                                                 Row(
                                                   children: [
                                                     CustomText.text12Bold(bestSellerList[index].price.toString()+" ريال ", Color(h.mainColor)),
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
                                                       bestSellerList[index].counter= bestSellerList[index].counter+1;
                                                     });
                                                   },
                                                   child:Container(
                                                       padding: EdgeInsets.all(2),
                                                       child: Icon(Icons.add,color: Colors.white,size: 20,)),
                                                 ),
                                                 CustomText.text12Bold(bestSellerList[index].counter.toString(), Colors.white),
                                                 GestureDetector(
                                                   onTap: (){
                                                     if(bestSellerList[index].counter>1){
                                                       setState(() {
                                                         bestSellerList[index].counter= bestSellerList[index].counter-1;
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
                                             "id":bestSellerList[index].id,
                                             "name":bestSellerList[index].name,
                                             "img":bestSellerList[index].coverPhoto,
                                             "description":bestSellerList[index].description,
                                             "price":double.parse(bestSellerList[index].price.toString()),
                                             "totalPrice":double.parse((bestSellerList[index].counter*bestSellerList[index].price).toString()),
                                             "quantity":bestSellerList[index].counter
                                           });
                                           try
                                           {
                                             GlobalFunction.UpdateTotalPrices(double.parse((bestSellerList[index].counter*bestSellerList[index].price).toString()));
                                             await dbHelper.addToCart(p1);
                                             GlobalFunction.addProductDialog(context,bestSellerList[index].counter,bestSellerList[index].name,);
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
                                 )
                               ],
                             );
                           }),
                         )

                       ],
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.01,),
                   Container(
                     width: MediaQuery.of(context).size.width*.9,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         CustomText.titleText("عروضنا"),
                          GestureDetector(
                              onTap: (){
                              Navigator.push(context, GlobalFunction.route(CategoryProduct(offersList,"عروضنا ")));
                              },
                          child: Text("عرض الكل",style: TextStyle(color: Color(h.mainColor),decoration: TextDecoration.underline),))
                                             ],
                     ),
                   ),
                   Divider(color: Colors.black12,thickness: 1,),
                   SizedBox(height: MediaQuery.of(context).size.height*.005,),
                   offersList.length==0?Container(
                     height: MediaQuery.of(context).size.height*.18,
                     width: MediaQuery.of(context).size.width,
                     child: Center(
                       child: CircularProgressIndicator(),
                     ),
                   ):
                   Container(
                     height: MediaQuery.of(context).size.height*.255,
                     width: MediaQuery.of(context).size.width,
                     color: Colors.white,
                     child: Row(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height*.255,
                           width: MediaQuery.of(context).size.width,
                           child: ListView.builder(scrollDirection: Axis.horizontal,itemCount:offersList.length ,itemBuilder: (context,index){
                             return Row(
                               children: [
                                 SizedBox(width: MediaQuery.of(context).size.width*.05,),
                                 Container(
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
                                       Image.network(GlobalVariable.URL+offersList[index].coverPhoto,
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
                                                 CustomText.btnText(offersList[index].name, Colors.black),
                                                 Row(
                                                   children: [
                                                     CustomText.text12Bold(offersList[index].price.toString()+" ريال ", Color(h.mainColor)),
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
                                                        offersList[index].counter= offersList[index].counter+1;
                                                      });
                                                     },
                                                     child:Container(
                                                         padding: EdgeInsets.all(2),
                                                         child: Icon(Icons.add,color: Colors.white,size: 20,)),
                                                   ),
                                                 CustomText.text12Bold(offersList[index].counter.toString(), Colors.white),
                                                 GestureDetector(
                                                   onTap: (){
                                                    if(offersList[index].counter>1){
                                                      setState(() {
                                                        offersList[index].counter= offersList[index].counter-1;
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
                                                "id":offersList[index].id,
                                                "name":offersList[index].name,
                                                "img":offersList[index].coverPhoto,
                                                "description":offersList[index].description,
                                                "price":double.parse(offersList[index].price.toString()),
                                                "totalPrice":double.parse((offersList[index].counter*offersList[index].price).toString()),
                                                "quantity":offersList[index].counter
                                                });
                                                try
                                                {
                                                GlobalFunction.UpdateTotalPrices(double.parse((offersList[index].counter*offersList[index].price).toString()));
                                                await dbHelper.addToCart(p1);
                                                GlobalFunction.addProductDialog(context,offersList[index].counter,offersList[index].name,);
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
                                 )
                               ],
                             );
                           }),
                         )

                       ],
                     ),
                   ),
                   SizedBox(height: MediaQuery.of(context).size.height*.09,),
                 ],
               ),
             )
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
   );
  }


}