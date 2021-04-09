import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Model/CategoryModel.dart';
import 'package:fruits/Model/ProductModel.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import 'package:fruits/Services/ProductServices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CategoryProduct.dart';
import '../main.dart';
import 'CustomText.dart';
import 'GlobalFunction.dart';
import 'HomePage.dart';
class Categories extends StatefulWidget{
  List <CategoryModelDetail>categoriesList=[];
  Categories(List <CategoryModelDetail>categoriesList){
    this.categoriesList=categoriesList;
  }
  @override
  State<StatefulWidget> createState() {
   return _state(this.categoriesList);
  }
}
class _state extends State<Categories>{
  List <CategoryModelDetail>categoriesList=[];
  _state(List <CategoryModelDetail>categoriesList){
    this.categoriesList=categoriesList;
  }
  TextEditingController SearchKey=new  TextEditingController();
  List<ProductDetail>ProductsCategory=[];
  ProductServices productServices=new ProductServices();
  Home h=new Home();
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
                        CustomText.titleText("كل الاقسام"),
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
                  SizedBox(height: MediaQuery.of(context).size.height*.015,),
                  Expanded(child: GridView.builder(
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
                            SizedBox(width: 2,),
                            CustomText.text12Bold("شامل الضريبة", Colors.black54)
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