import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomText.dart';
import '../Services/UserServices.dart';
import '../main.dart';
import 'GlobalFunction.dart';
class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Register>{
  TextEditingController name =new TextEditingController();
  TextEditingController phone =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController password=new TextEditingController();
  TextEditingController confirmPassword=new TextEditingController();
  TextEditingController Address=new TextEditingController();
  FocusNode phoneNode=new FocusNode();
  FocusNode emailNode=new FocusNode();
  FocusNode addressNode=new FocusNode();
  FocusNode passwordNode=new FocusNode();
  FocusNode confirmPasswordNode=new FocusNode();
  bool passVisibility=true;
  bool passVisibility2=true;
  int error=-1;
  Home h=new Home();
  UserServices userServices=new UserServices();
  String message;
  Map<String,dynamic>responce;
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.035,
                right: MediaQuery.of(context).size.width*.035
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top:8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ImageIcon(AssetImage("images/IconBack.png"),),
                      ],
                    ),
                  ),
                ),
                Image.asset("images/logo.png",
                  height: MediaQuery.of(context).size.height*.25,
                  fit: BoxFit.cover,
                ),
                CustomText.titleText("تسجيل"),
                CustomText.text12Bold("من فضلك قم بادخال بياناتك",Colors.black54),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(margin: EdgeInsets.zero,height: MediaQuery.of(context).size.height*.03,color: Colors.white),
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
                          keyboardType: TextInputType.text,
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
                            suffixIcon: Icon(Icons.person),
                            hintText:'الاسم' ,
                            errorStyle: TextStyle(fontSize: 0),
                            hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                          ),
                          controller: name,
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
                          keyboardType: TextInputType.number,
                          focusNode: phoneNode,
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
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailNode,
                          onFieldSubmitted: (value){
                            FocusScope.of(context).requestFocus(addressNode);
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
                            suffixIcon: Icon(Icons.email),
                            hintText:'البريد الالكتروني' ,
                            errorStyle: TextStyle(fontSize: 0),
                            hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                          ),
                          controller: email,
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
                          keyboardType: TextInputType.text,
                          focusNode: addressNode,
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
                            suffixIcon: Icon(Icons.location_on),
                            hintText:'العنوان بالتفصيل' ,
                            errorStyle: TextStyle(fontSize: 0),
                            hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                          ),
                          controller: Address,
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
                            FocusScope.of(context).requestFocus(confirmPasswordNode);
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
                          focusNode: confirmPasswordNode,
                          obscureText: passVisibility2,
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
                            hintText: "تاكيد كلمة المرور",
                            errorStyle: TextStyle(fontSize: 0),
                            hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                            suffixIcon:InkWell(
                              child: Icon(passVisibility2?Icons.visibility:Icons.visibility_off,color: Colors.black38,),
                              onTap: (){
                                setState(() {
                                  passVisibility2=!passVisibility2;
                                });
                              },
                            ) ,
                          ),
                          controller: confirmPassword,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                message==null?SizedBox():CustomText.text12Bold(message, Color(h.mainColor)),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                GestureDetector(
                  onTap: ()async{
                    if(formKey.currentState.validate()){
                      SharedPreferences prefs=await SharedPreferences.getInstance();
                      responce=await userServices.register(prefs.getString("lang"), name.text, phone.text,Address.text, email.text, password.text);
                       if(responce["status"]==200)
                         {
                           GlobalFunction.SaveData("UserId", responce["user"]["id"]);
                           GlobalFunction.SaveData("Username", responce["user"]["name"]);
                           GlobalFunction.SaveData("Email", responce["user"]["email"]);
                           GlobalFunction.SaveData("Img", responce["user"]["photo"]);
                           GlobalFunction.SaveData("Token", responce["user"]["token"]);
                           Navigator.pushNamedAndRemoveUntil(context, "/VerificationCode", (route) => false);
                         }
                       else{
                         setState(() {
                           message=responce["message"];
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
                    child: CustomText.btnText("تسجيل", Colors.white),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.03,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}