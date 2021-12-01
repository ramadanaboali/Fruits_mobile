import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:fruits/views/PaymentMethod.dart';
import 'package:fruits/views/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomText.dart';
import 'EditProfile.dart';
import 'HelpCenter.dart';
import 'Orders.dart';
import 'Setting.dart';
import '../Services/UserServices.dart';
import '../main.dart';
import 'AboutApp.dart';
import 'GlobalFunction.dart';

class ProFile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<ProFile>{
  Home h=new Home();
  String img;
  String name;
  String email;
  String UserId;
  TextEditingController phone =new TextEditingController();
  TextEditingController password=new TextEditingController();
  FocusNode passwordNode=new FocusNode();
  UserServices userServices=new UserServices();
  Map<String,dynamic>responces;
  String message;
  bool passVisibility=true;
  int error=-1;
  final formKey=GlobalKey<FormState>();
  loadData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      img=prefs.getString("Img");
      name=prefs.getString("Username");
      email=prefs.getString("Email");
      UserId=prefs.getString("UserId");
    });
    print("0000000000000000000000000000000000000000000000000000000000000000");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return ParentPage.user_id==null?
          Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
         child: Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.035,
              right: MediaQuery.of(context).size.width*.035
          ),
          child: Column(
            children: [
                /*   InkWell(
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
              ),*/
              SizedBox(height: MediaQuery.of(context).size.height*.1,),
              Image.asset("images/logo.png",
                height: MediaQuery.of(context).size.height*.25,
                fit: BoxFit.cover,
              ),
              CustomText.titleText("تسجيل الدخول"),
              //  CustomText.text12Bold("من فضلك قم بادخال بياناتك",Colors.black54),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(margin: EdgeInsets.zero,height: MediaQuery.of(context).size.height*.05,color: Colors.white),
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
                          FocusScope.of(context).requestFocus(passwordNode);
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
                    SizedBox(height: 20,),
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
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        focusNode: passwordNode,
                        obscureText: passVisibility,
                        validator: (value){
                          if(value.isEmpty){
                            return '';
                          }
                          // else if(loginValdite['Message']=="Password is incorrect.");
                          return null;
                        },
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
                          hintText: "كلمة المرور",
                          errorStyle: TextStyle(fontSize: 0),
                          hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                          suffixIcon:InkWell(
                            child: Icon(passVisibility?Icons.visibility:Icons.visibility_off,color: Colors.black38,),
                            onTap: (){
                              setState(() {
                                passVisibility=!passVisibility;
                              });
                            },
                          ) ,
                        ),
                        controller: password,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              message==null?SizedBox():CustomText.text12Bold(message, Color(h.mainColor)),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              InkWell(
                onTap: ()async{
                  SharedPreferences pref=await SharedPreferences.getInstance();
                  if(formKey.currentState.validate()){
                    responces=await userServices.login("ar"/*ParentPage.language*/, phone.text, password.text,pref.getString("device_token"));
                    if(responces["status"]==200)
                    {
                      GlobalFunction.SaveData("UserId", responces["user"]["id"]);
                      GlobalFunction.SaveData("Username", responces["user"]["name"]);
                      GlobalFunction.SaveData("Email", responces["user"]["email"]);
                      GlobalFunction.SaveData("Img", responces["user"]["photo"]);
                      GlobalFunction.SaveData("Token", responces["user"]["token"]);
                      setState(() {
                        ParentPage.user_id= responces["user"]["id"];
                      });
                      Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
                    }
                    else {
                      setState(() {
                        message=responces["message"];
                      });
                    }
                  }
                  else{
                    setState(() {
                      error=1;
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.065,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(h.mainColor)
                  ),
                  child: CustomText.btnText("تسجيل الدخول", Colors.white),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.03,),
              InkWell(
                onTap: (){
                  Navigator.push(context, GlobalFunction.route(Register()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText.text12("لا تملتك حساب بالفعل "),
                      Text("سجل حساب جديد",style: TextStyle(decoration: TextDecoration.underline,color: Color(h.mainColor),fontSize: 12,fontWeight: FontWeight.bold),)

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )

     :Scaffold(
       body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
       image: DecorationImage(image: AssetImage("images/profileBG.png"), fit: BoxFit.contain),
       ),
        child: SingleChildScrollView(
        child: Column(
          children: [
            name==null? Container(height: MediaQuery.of(context).size.height*.2,) :Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    child: Image.network(GlobalVariable.URL+img,
                      height: MediaQuery.of(context).size.height*.16,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.005,),
                  CustomText.btnText(name ,Colors.black),
                  CustomText.text12Bold(email, Colors.black38),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                ],
              ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.05,
                right: MediaQuery.of(context).size.width*.05,),
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.02,
                right: MediaQuery.of(context).size.width*.02,
                top: MediaQuery.of(context).size.height*.02,
                bottom: MediaQuery.of(context).size.height*.02
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
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, GlobalFunction.route(EditProFile()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Color(h.mainColor)
                              ),
                              padding: EdgeInsets.all(7),
                              child: ImageIcon(AssetImage("images/ProfileIcon.png"),color: Colors.white,size: 18,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['profileinfo'], Colors.black54),

                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_forward_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12,thickness: 1,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, GlobalFunction.route(Orders()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Color(h.mainColor)
                              ),
                              padding: EdgeInsets.all(7),
                              child: ImageIcon(AssetImage("images/aboutApp.png"),color: Colors.white,size: 18,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['myOrders'], Colors.black54)
                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12,thickness: 1,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, GlobalFunction.route(PaymentMethod()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Color(h.mainColor)
                              ),
                              padding: EdgeInsets.all(2),
                              child: ImageIcon(AssetImage("images/visaicon.png"),color: Colors.white,size: 27.5,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['paymentmethod'], Colors.black54)
                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.05,
                right: MediaQuery.of(context).size.width*.05,),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.02,
                  right: MediaQuery.of(context).size.width*.02,
                  top: MediaQuery.of(context).size.height*.02,
                  bottom: MediaQuery.of(context).size.height*.02
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
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, GlobalFunction.route(Setting()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Color(h.mainColor)
                              ),
                              padding: EdgeInsets.all(7),
                              child: ImageIcon(AssetImage("images/setting.png"),color: Colors.white,size:18,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['setting'], Colors.black54)
                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12,thickness: 1,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, GlobalFunction.route(HelpCenter()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Color(h.mainColor)
                              ),
                              padding: EdgeInsets.all(7),
                              child: ImageIcon(AssetImage("images/aboutApp.png"),color: Colors.white,size: 18,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['helpcenter'], Colors.black54)
                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12,thickness: 1,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, GlobalFunction.route(AboutApp()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Color(h.mainColor)
                              ),
                              padding: EdgeInsets.all(7),
                              child: ImageIcon(AssetImage("images/phone.png"),color: Colors.white,size: 18,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['aboutus'], Colors.black54)
                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  ),
                  Divider(color: Colors.black12,thickness: 1,),
                  InkWell(
                    onTap: (){
                    //  Navigator.push(context, GlobalFunction.route(AboutApp()));
                      share("https://play.google.com/store");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Color(h.mainColor)
                              ),
                              padding: EdgeInsets.all(7),
                              child: ImageIcon(AssetImage("images/share.png"),color: Colors.white,size: 18,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['shareapp'], Colors.black54)
                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.05,
                right: MediaQuery.of(context).size.width*.05,),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.02,
                  right: MediaQuery.of(context).size.width*.02,
                  top: MediaQuery.of(context).size.height*.01,
                  bottom: MediaQuery.of(context).size.height*.01
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
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Logout();
                      //Navigator.pushNamedAndRemoveUntil(context, "/Slider", (route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Colors.red
                              ),
                              padding: EdgeInsets.all(7),
                              child: ImageIcon(AssetImage("images/logout.png"),color: Colors.white,size: 18,),
                            ),
                            SizedBox(width: 12,),
                            CustomText.btnText(DemoLocalizations.of(context).title['logout'], Colors.black54)
                          ],
                        ),
                        Icon(ParentPage.language=="ar"?Icons.arrow_back_ios_outlined:Icons.arrow_forward_ios_outlined,color: Colors.black54,size: 20,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
          ],
        ),
      ),
      ),
    );
  }
  Logout()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.remove("UserId");
    prefs.remove("Token");
    Navigator.pushNamedAndRemoveUntil(context, "/Slider", (route) => false);
  }
  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Product Details',
        text: '',
        linkUrl: url,
        chooserTitle: 'Product'
    );
  }
}