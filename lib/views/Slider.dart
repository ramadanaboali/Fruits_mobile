import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fruits/Model/SliderModel.dart';
import 'package:fruits/Services/ConfigServices.dart';
import 'package:fruits/Services/GlobalVariable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomText.dart';
import 'Login.dart';
import '../main.dart';
import 'GlobalFunction.dart';
class slider extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<slider>{
  Home h=new Home();
  int indexSlider;
  List<SliderModelDetail>data=[];
  ConfigServices configServices=new ConfigServices();
  loadData()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    data=await configServices.SliderServices(preferences.getString("lang"));
    setState(() {
    });
    print(data);
    print("sssssssssssss");
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
     body: data==null?Center(child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Image.asset("images/logo.png",width: MediaQuery.of(context).size.width*.7,),
         SizedBox(height: MediaQuery.of(context).size.height*.02,),
         CustomText.btnText14("تاكد من اتصال الهاتف بالانترنت", Colors.black54),
         SizedBox(height: MediaQuery.of(context).size.height*.12,),
       ],
     )):data.length==0?Center(child: CircularProgressIndicator(),)
         :Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       child: new Swiper(
         autoplay: true,
         itemCount: 3,
         //index: nextSlide(),
         itemBuilder: (BuildContext context, int index) {
           return Container(
             child: Column(
               children: [
                 SizedBox(
                   height: MediaQuery.of(context).size.height * .08,
                 ),
                 Container(
                   height: 5,
                   width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.only(
                     left:MediaQuery.of(context).size.width*.05 ,
                     right: MediaQuery.of(context).size.width*.05
                   ),
                   child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                  itemCount: data.length,itemBuilder: (context,index){
                     return Container(
                       margin: EdgeInsets.only(left: 1.5,right: 1.5),
                       height: 5,
                       width: ((MediaQuery.of(context).size.width*.9)/3)-3,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(100)),
                           color: indexSlider==index?Color(h.mainColor):Colors.black12
                       ),
                     );
                   }),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * .09,
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   child: Row(
                     children: [
                       Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Color(h.mainColor),
                         ),
                         width: MediaQuery.of(context).size.width*.25,
                         height: 5,
                       )
                     ],
                   ),
                 ),
                 new Center(
                   child: Image.network(GlobalVariable.URL+data[index].photo,
                     fit: BoxFit.fitHeight,
                     height: MediaQuery.of(context).size.height * .35,
                     width: MediaQuery.of(context).size.width * .9,
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Color(h.mainColor),
                         ),
                         width: MediaQuery.of(context).size.width*.25,
                         height: 5,
                       )
                     ],
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * .05,
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width * .8,
                   child: Text(
                      data[index].title,style: TextStyle(color:Color(h.mainColor),fontSize: 17,fontWeight: FontWeight.bold),
                     textAlign: TextAlign.center,maxLines: 1,
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * .05,
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width*.85,
                   height: MediaQuery.of(context).size.height * .18,
                   alignment: Alignment.topCenter,
                   child: Text(
                     data[index].description,
                     style:
                     TextStyle(fontSize: 11.5, color: Colors.black45,fontWeight: FontWeight.bold),
                     textAlign: TextAlign.center,maxLines: 3,
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * .02,
                 ),
                 GestureDetector(
                   child: Container(
                       height: MediaQuery.of(context).size.height*.06,
                       width: MediaQuery.of(context).size.width*.9,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         color: Color(h.mainColor),
                       ),

                       alignment: Alignment.center,
                       child: CustomText.btnText("تسوق الان", Colors.white)

                   ),
                   onTap:() async {
                     SharedPreferences prefs = await SharedPreferences.getInstance();
                    if(prefs.get("UserId")==null)
                     Navigator.push(context, GlobalFunction.route(Login()));
                    else
                      Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);




                   },
                 ),


               ],
             ),

           );
         },
         onIndexChanged: (index){
           setState(() {
             indexSlider=index;
           });
         },

         pagination: new SwiperPagination(
           margin: EdgeInsets.only(
               bottom: MediaQuery.of(context).size.height*.03
           ),
           builder: new DotSwiperPaginationBuilder(
             size: 0,
             activeSize: 0,
             color: Colors.black,
             activeColor: Colors.white,
           ),
         ),
         control: new SwiperControl(
           color: Color(h.mainColor),
           size: 0
         ),
       ),
     ),
   );
  }
}