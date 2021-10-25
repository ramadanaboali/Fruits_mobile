import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Model/NotificationModel.dart';
import 'package:fruits/Services/UserServices.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'CustomSearch.dart';
import 'CustomText.dart';

class Notifications extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<Notifications>{
  Home h=new Home();
  List<NotificationDetail>data;
  UserServices userServices=new UserServices();
  var lang;
  loadData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    if(prefs.getString("UserId")==null){
      setState(() {
        data=[];
      });
    }else{
      data=await userServices.GetNotification(prefs.getString("UserId"));
      setState(() {
        lang=prefs.getString("lang");
      });
    }
    print(data.length);
    print("00000000000000000000000000000000000000000000000000000000000000000000000000000000");
  }
  @override
  void initState(){
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
      child: Column(
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
                  ImageIcon(AssetImage("images/notification.png"),color: Color(h.mainColor),),
                    SizedBox(width: 5,),
                    CustomText.titleTextColor(DemoLocalizations.of(context).title['notification'],Color(h.mainColor)),
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
                      ParentPage.language=="ar"?ImageIcon(AssetImage("images/IconBack.png"),):Icon(Icons.arrow_forward_rounded,size: 30,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black12,thickness: 1,),
          SizedBox(height: MediaQuery.of(context).size.height*.01,),
          data==null?Expanded(child: Center(child: CircularProgressIndicator(),)):data.length==0?
          Expanded(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.15,),
                Image.asset("images/logo.png",
                  height: MediaQuery.of(context).size.height*.15,
                ),
                CustomText.btnText("No Notification For You", Colors.black)
              ],
            ),
          ):Expanded(child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: data.length,itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.05,
                right:  MediaQuery.of(context).size.width*.05,
                bottom: MediaQuery.of(context).size.height*.01
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.03,
                  right:  MediaQuery.of(context).size.width*.03,
                top: MediaQuery.of(context).size.height*.01,
                bottom:  MediaQuery.of(context).size.height*.01
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black12,width: 1),
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
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: Colors.white,width: 2),
                      color: Color(0xffebfffc),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    child:  ImageIcon(AssetImage("images/notification.png"),size: 40,color: Color(h.mainColor),),
                  ),
                  SizedBox(width: 10,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 5),
                     Container(
                         width: MediaQuery.of(context).size.width*.62,
                         child: CustomText.text12Bold(data[index].title, Colors.black54)),
                    Container(
                      width: MediaQuery.of(context).size.width*.62,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(

                              child:Text(data[index].creationDate,style: TextStyle(fontSize: 12,color:Color(h.mainColor)),))

                        ],
                      ),
                    )
                   ],
                 )
                ],
              ),
            );
          }))
        ],
      ),
    ),
  );
  }
}