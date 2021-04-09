import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomText.dart';
import 'package:fruits/main.dart';


class Orders extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Orders>{
  Home h=new Home();
  int type=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                    CustomText.titleTextColor("طلباتي",Colors.black),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context, "/Profile", (route) => false);
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
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          type=1;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*.35,
                        height: MediaQuery.of(context).size.height*.065,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black12,width: 1),
                            color: type==1?Color(h.mainColor):Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CustomText.btnText("الحالي",type==1? Colors.white:Colors.black54),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                           type=2;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*.35,
                        height: MediaQuery.of(context).size.height*.065,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black12,width: 1),
                            color: type==2?Color(h.mainColor):Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CustomText.btnText("الماضي",type==2? Colors.white:Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Expanded(child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*.01,
                    bottom: MediaQuery.of(context).size.height*.01
                  ),
                  itemCount: 15,itemBuilder: (context,index){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*.04,
                      right: MediaQuery.of(context).size.width*.04,
                    bottom: MediaQuery.of(context).size.height*.01
                  ),

                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.15,
                        width: MediaQuery.of(context).size.width*.9,
                      ),
                      Positioned(
                        right: 15,
                        child: Container(
                          height: MediaQuery.of(context).size.height*.15,
                          width: MediaQuery.of(context).size.width*.92-15,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Row(
                               children: [
                                 SizedBox(width: MediaQuery.of(context).size.width*.055,),
                                 Container(
                                   width: MediaQuery.of(context).size.width*.25,
                                   height: MediaQuery.of(context).size.height*.13,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       border: Border.all(color: Colors.black12,width: 1)
                                   ),
                                   padding: EdgeInsets.all(2),
                                   child: Image.asset("images/product.png",
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                                 SizedBox(width: 7,),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     CustomText.btnText("جزر اصلي", Colors.black),
                                     SizedBox(height: 5,),
                                     Row(
                                       children: [
                                         CustomText.text12Bold("18 ريال", Color(h.mainColor)),
                                         CustomText.text12Bold("\\ للكيلو", Colors.black38)
                                       ],
                                     ),
                                     SizedBox(height: 5,),
                                     Container(
                                       width: MediaQuery.of(context).size.width*.25,
                                       height: MediaQuery.of(context).size.height*.035,
                                       alignment: Alignment.center,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.all(Radius.circular(5)),
                                         border: Border.all(color: Colors.black12,width: 1),
                                         color: Color(h.mainColor),
                                         boxShadow: [
                                           BoxShadow(
                                             color: Colors.grey.withOpacity(0.1),
                                             spreadRadius: 3,
                                             blurRadius: 3,
                                             offset: Offset(0, 3), // changes position of shadow
                                           ),
                                         ],
                                       ),
                                       child: CustomText.text12Bold("تم التوصيل",Colors.white),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                              Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*.13,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Icon(Icons.date_range_outlined,color: Colors.black45,size: 20,),
                                        SizedBox(width: 3,),
                                        CustomText.text10Bold("2020-12-20", Colors.black45)
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*.02,),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height*.045,
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(h.mainColor)
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.check_circle,color: Colors.white,)
                      ))
                    ],
                  ),
                );
              }))



            ],
          ),
        ),
      ),
    );
  }
}