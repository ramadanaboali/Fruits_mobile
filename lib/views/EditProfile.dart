import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      name.text="محمد علي علي";
      email.text="asd@mail.com";
      phone.text="012865865";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    CustomText.titleTextColor("اعدادات الحساب",Colors.black),
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
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(1000),),
                              border: Border.all(color: Colors.white,width: 3)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(1000),
                            ),
                            child: Image.asset("images/user.jpg",
                              height: MediaQuery.of(context).size.height*.15,
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
                  ],
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.005,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.text12Bold("الاسم", Colors.black87),
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
                    suffixIcon: Icon(Icons.phone),
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
                    CustomText.text12Bold("البريد الالكتروني", Colors.black87),
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
                    suffixIcon: Icon(Icons.phone),
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
                    CustomText.text12Bold("رقم الهاتف ", Colors.black87),
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
                    suffixIcon: Icon(Icons.phone),
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
                    CustomText.text12Bold("النوع", Colors.black87),
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
                      CustomText.text12Bold("ذكر", gender=="male"?Color(h.mainColor) :Colors.black38),
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
                        CustomText.text12Bold("انثي", gender=="female"?Color(h.mainColor) :Colors.black38),
                      ],

                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}