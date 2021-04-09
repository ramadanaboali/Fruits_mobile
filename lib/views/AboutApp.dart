import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'CustomText.dart';

class AboutApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AboutApp>{
  Home h=new Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/profileBG.png"), fit: BoxFit.contain),
        ),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.07,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.titleTextColor("من نحن",Colors.black),
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
              Image.asset("images/logo.png",color: Color(h.mainColor),
                height: MediaQuery.of(context).size.height*.2,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText.text12Bold("تطبيق فروتس", Colors.black),
                    SizedBox(width: 5,),
                    CustomText.text12Bold("Ver 1.2.3", Color(h.mainColor)),
                  ],
                ),
              ),
              Expanded(child: Container(
                width: MediaQuery.of(context).size.width*.9,
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*.9,
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.2),
                        child: Image.asset("images/logo.png",color: Color(h.mainColor).withOpacity(.15),
                        height: MediaQuery.of(context).size.height*.4,)),
                    CustomText.text12Boldcenter(
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى"+"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى"+"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى"+"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى"+"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى"+ "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى",
                        Colors.black45),
                  ],
                )
              )),
             




            ],
          ),
        ),
      ),
    );
  }
}