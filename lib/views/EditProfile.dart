import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import 'package:fruits/Services/UserServices.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'CustomText.dart';
import 'package:fruits/main.dart';


class EditProFile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<EditProFile>{
  Home h=new Home();
  TextEditingController name =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController phone =new TextEditingController();
  FocusNode emailNode=new FocusNode();
  FocusNode phoneNode=new FocusNode();
  var error=-1;
  var gender;
  var user_id;
  UserServices userServices =new UserServices();
  Map<String,dynamic>data;
  loadData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    data=await userServices.getUserData(prefs.getString("UserId"), prefs.getString("UserId"));
    setState(() {
      user_id=prefs.getString("UserId");
      name.text=data["name"];
      email.text=data["email"];
      phone.text=data["phone"];
      gender=data["gender"];
    });
    print(data);
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
      body: data==null?Center(child: CircularProgressIndicator(),):
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.05,
          right: MediaQuery.of(context).size.width*.05
        ),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/profileBG.png"), fit: BoxFit.contain),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.titleTextColor(DemoLocalizations.of(context).title['profilesetting'],Colors.black),
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
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        pickImage(context);
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(1000),),
                                border: Border.all(color: Colors.white,width: 3)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(1000),
                              ),
                              child: Image.network(GlobalVariable.URL+data["photo"],
                                height: MediaQuery.of(context).size.height*.15,
                                width:  MediaQuery.of(context).size.height*.15,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height*.1,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.camera_alt_outlined,color: Color(h.mainColor),size: 20,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.005,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.text12Bold(DemoLocalizations.of(context).title['name'], Colors.black87),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: error==-1?Colors.grey.withOpacity(0.1):Colors.white,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value){
                    FocusScope.of(context).requestFocus(emailNode);
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
                 //   suffixIcon: Icon(Icons.phone),
                    hintText:'' ,
                    errorStyle: TextStyle(fontSize: 0),
                    hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                  controller: name,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.text12Bold(DemoLocalizations.of(context).title['email'], Colors.black87),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: error==-1?Colors.grey.withOpacity(0.1):Colors.white,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value){
                    FocusScope.of(context).requestFocus(phoneNode);
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
                   // suffixIcon: Icon(Icons.phone),
                    hintText:'رقم الهاتف' ,
                    errorStyle: TextStyle(fontSize: 0),
                    hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                  controller: email,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.text12Bold(DemoLocalizations.of(context).title['phonenumber'], Colors.black87),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: error==-1?Colors.grey.withOpacity(0.1):Colors.white,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value){
                    FocusScope.of(context).requestFocus(emailNode);
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
                   // suffixIcon: Icon(Icons.phone),
                    hintText:'رقم الهاتف' ,
                    errorStyle: TextStyle(fontSize: 0),
                    hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                  controller: phone,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.text12Bold(DemoLocalizations.of(context).title['gender'], Colors.black87),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gender="male";
                      });
                    },
                    child: Row(
                    children: [
                      Radio(value: "male",groupValue: gender,onChanged: (val){
                        setState(() {
                          gender=val;
                        });
                      },activeColor: Color(h.mainColor),),
                      CustomText.text12Bold(DemoLocalizations.of(context).title['male'], gender=="male"?Color(h.mainColor) :Colors.black38),
                    ],

                    ),
                  ),
                  SizedBox(width:10),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        gender="female";
                      });
                    },
                    child: Row(
                      children: [
                        Radio(value: "female",groupValue: gender,onChanged: (val){
                          setState(() {
                            gender=val;
                          });
                        },activeColor: Color(h.mainColor),),
                        CustomText.text12Bold(DemoLocalizations.of(context).title['female'], gender=="female"?Color(h.mainColor) :Colors.black38),
                      ],

                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
              GestureDetector(
                onTap: ()async{
                  Map<String,dynamic>data=await userServices.updateProfile(user_id,name.text, email.text, phone.text);
                  if(data["data"]["status"]==200){
                    Toast.show(
                        data["data"]["message"], context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*.6,
                  height: MediaQuery.of(context).size.height*.065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(h.mainColor)
                  ),
                  alignment: Alignment.center,
                  child: CustomText.btnText("Edit", Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  File selectedImage;
  pickImage(BuildContext context ) async {
    var profileImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(profileImage.path);
    });
    UserServices.updateAvatar(selectedImage, context, user_id);
    loadData();

  }
}