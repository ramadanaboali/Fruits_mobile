import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:fruits/views/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomText.dart';
import '../Services/UserServices.dart';
import '../main.dart';
import 'GlobalFunction.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<Login>{
  TextEditingController phone =new TextEditingController();
  TextEditingController password=new TextEditingController();
  FocusNode passwordNode=new FocusNode();
  UserServices userServices=new UserServices();
  Map<String,dynamic>responces;
  String message;
  bool passVisibility=true;
  int error=-1;
  Home h=new Home();
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
                    padding: EdgeInsets.only(top:10),
                    child: Row(
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
                CustomText.titleText(DemoLocalizations.of(context).title['login']),
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
                            hintText:DemoLocalizations.of(context).title['phonenumber'] ,
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
                            hintText: DemoLocalizations.of(context).title['password'],
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
                message==null?SizedBox():CustomText.text12Bold(message, Colors.red),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                GestureDetector(
                  onTap: ()async{
                    SharedPreferences pref=await SharedPreferences.getInstance();
                    if(formKey.currentState.validate()){
                      responces=await userServices.login("ar"/*ParentPage.language*/, phone.text, password.text,pref.getString("device_token"));
                    print(responces);
                    print("__________________________");
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
                    child: CustomText.btnText(DemoLocalizations.of(context).title['login'], Colors.white),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.03,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, GlobalFunction.route(Register()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText.text12(DemoLocalizations.of(context).title['nothaveaccount']+" "),
                        Text(DemoLocalizations.of(context).title['createnewaccount']+" ",style: TextStyle(decoration: TextDecoration.underline,color: Color(h.mainColor),fontSize: 12,fontWeight: FontWeight.bold),)

                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.07,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*.065,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage("images/VisitorIcon.png"),color: Color(h.mainColor),),
                        SizedBox(width: 10,),
                        CustomText.btnText(DemoLocalizations.of(context).title['Browsevisitor'], Color(h.mainColor))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}