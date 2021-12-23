import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Model/AddressModel.dart';
import 'package:fruits/Model/CartLocalModel.dart';
import 'package:fruits/Model/PaymentModel.dart';
import 'package:fruits/Services/AddressServices.dart';
import 'package:fruits/Services/ProductServices.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:fruits/views/AddAddress.dart';
import 'package:fruits/views/Cart.dart';
import 'package:fruits/views/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomSearch.dart';

import '../main.dart';
import 'ConfirmOrder.dart';
import 'CustomText.dart';
import 'GlobalFunction.dart';

class Address extends StatefulWidget {
  List items;
  Address(items) {
    this.items = items;
  }
  @override
  State<StatefulWidget> createState() {
    return _state(this.items);
  }
}

class _state extends State<Address> {
  Home h = new Home();
  List items;
  _state(items) {
    this.items = items;
  }
  var address = "address";
  AddressDetail SelectedAddress;
  AddressServices addressServices = new AddressServices();
  List<AddressDetail> addressList;
  List<PaymentDetail> paymentList = [];
  ProductServices productServices = new ProductServices();
  loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    addressList = await addressServices.GetAddress(
        pref.getString("lang"), pref.getString("UserId"));
    paymentList = await addressServices.GetPayment(
        pref.getString("lang"), pref.getString("Token"));
    if (addressList.length > 0) {
      SelectedAddress = addressList[0];
    }
    if (paymentList != null && paymentList.length > 0) {
      setState(() {
        payment = paymentList[0].id;
      });
    }
    setState(() {
      time = times[0];
    });
    // print(paymentList.length);
    print("00000000000000000000000000000000000000000");
  }

  var payment;
  var time;
  List times = [
    "من 12 مساءا الي 4 مساءا",
    "من 4 مساءا الي 9 مساءا",
    "من 9 مساءا الي 12 صباحا",
    "من 1صباحا الي 5 صباحا",
    "من 6 صباحا الي 11 صباحا"
  ];
  var day = "thursday";
  TextEditingController code = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, GlobalFunction.route(HomePage(2)));
      },
      child: Scaffold(
        body: addressList == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/background.png"),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .08,
                      ),
                      CustomSearch(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ImageIcon(
                                  AssetImage("images/shoppingCard.png"),
                                  color: Color(h.mainColor),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText.titleTextColor(
                                    DemoLocalizations.of(context)
                                        .title['DeliveryAddress'],
                                    Color(h.mainColor)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, GlobalFunction.route(HomePage(2)));
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ParentPage.language == "ar"
                                        ? ImageIcon(
                                            AssetImage("images/IconBack.png"),
                                          )
                                        : Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 30,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                child: Column(
                                  children: [
                                    Container(
                                      child: ListView.builder(
                                          itemCount: addressList.length,
                                          shrinkWrap: true,
                                          primary: false,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  SelectedAddress =
                                                      addressList[index];
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Radio(
                                                      value: addressList[index],
                                                      groupValue:
                                                          SelectedAddress,
                                                      onChanged: (val) {
                                                        setState(() {
                                                          SelectedAddress =
                                                              addressList[
                                                                  index];
                                                        });
                                                      },
                                                      activeColor:
                                                          Color(h.mainColor),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .76,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .065,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 3,
                                                            blurRadius: 3,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: Text(
                                                        addressList[index]
                                                            .address,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            GlobalFunction.route(
                                                AddAdress(this.items)));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Radio(
                                            value: "address",
                                            groupValue: address,
                                            onChanged: (val) {
                                              setState(() {
                                                address = "address";
                                              });
                                            },
                                            activeColor: Colors.white,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .75,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  DemoLocalizations.of(context)
                                                      .title['addnewaddress'],
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                                ImageIcon(AssetImage(
                                                    "images/mapLocator.png"))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .065,
                                  width: MediaQuery.of(context).size.width * .9,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(h.mainColor)),
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      CustomText.btnText(
                                          DemoLocalizations.of(context)
                                              .title['paymentmethod'],
                                          Colors.white),
                                    ],
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * .9,
                                  padding: EdgeInsets.only(
                                      //left: MediaQuery.of(context).size.width
                                      ),
                                  child: paymentList != null
                                      ? ListView.builder(
                                          itemCount: paymentList.length,
                                          primary: false,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  payment =
                                                      paymentList[index].id;
                                                });
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .06,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value:
                                                              paymentList[index]
                                                                  .id,
                                                          groupValue: payment,
                                                          onChanged: (val) {
                                                            setState(() {
                                                              payment = val;
                                                            });
                                                          },
                                                          activeColor: Color(
                                                              h.mainColor),
                                                        ),
                                                        CustomText.text12Bold(
                                                            paymentList[index]
                                                                .name,
                                                            payment ==
                                                                    paymentList[
                                                                            index]
                                                                        .name
                                                                ? Color(
                                                                    h.mainColor)
                                                                : Colors
                                                                    .black54),
                                                      ],
                                                    ),
                                                    Image.asset(
                                                      "images/visa.png",
                                                      width: 50,
                                                      height: 20,
                                                      color: payment ==
                                                              paymentList[index]
                                                                  .name
                                                          ? Color(h.mainColor)
                                                          : Colors.black54,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
                                      : Center()),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .065,
                                  width: MediaQuery.of(context).size.width * .9,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(h.mainColor)),
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      CustomText.btnText(
                                          DemoLocalizations.of(context)
                                              .title['deliveryTime'],
                                          Colors.white),
                                    ],
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            day = "thursday";
                                          });
                                        },
                                        child: Text(
                                          "الخميس",
                                          style: TextStyle(
                                              color: day == "thursday"
                                                  ? Color(h.mainColor)
                                                  : Colors.black54,
                                              decoration:
                                                  TextDecoration.underline),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            day = "friday";
                                          });
                                        },
                                        child: Text(
                                          "الجمعة",
                                          style: TextStyle(
                                              color: day == "friday"
                                                  ? Color(h.mainColor)
                                                  : Colors.black54,
                                              decoration:
                                                  TextDecoration.underline),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            day = "saterday";
                                          });
                                        },
                                        child: Text(
                                          "السبت",
                                          style: TextStyle(
                                              color: day == "saterday"
                                                  ? Color(h.mainColor)
                                                  : Colors.black54,
                                              decoration:
                                                  TextDecoration.underline),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .9,
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: times.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            time = times[index];
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: time == times[index]
                                                    ? Color(h.mainColor)
                                                    : Colors.black54,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              CustomText.text12Bold(
                                                times[index],
                                                time == times[index]
                                                    ? Color(h.mainColor)
                                                    : Colors.black54,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .015,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      GlobalFunction.route(ConfirmOrder(
                                          this.items,
                                          this.payment,
                                          this.SelectedAddress,
                                          this.time)));
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .065,
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Color(h.mainColor)),
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText.btnText(
                                            DemoLocalizations.of(context)
                                                .title['confirmOrder'],
                                            Colors.white),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .03,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
