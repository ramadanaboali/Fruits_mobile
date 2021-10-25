import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/Services/AddressServices.dart';
import 'package:fruits/main.dart';
import 'package:fruits/utils/app_Localization.dart';
import 'package:fruits/views/Address.dart';
import 'package:fruits/views/CustomText.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocode;
import 'package:shared_preferences/shared_preferences.dart';

import 'GlobalFunction.dart';
class AddAdress extends StatefulWidget{
  List items;
  AddAdress(items){
    this.items=items;
  }
  @override
  State<StatefulWidget> createState() {
   return _state(this.items);
  }
}
class _state extends State<AddAdress>{
  List items;
  _state(items){
    this.items=items;
  }
  Home h=new Home();
  double long = 0.0;
  double lat = 0.0;
  final Set<Marker> listMarkers = {};
  String address = "Current Location";
  Completer<GoogleMapController> _controller = Completer();
  List<geocode.Placemark> newPlace;
  AddressServices addressServices=new AddressServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onTap: (LatLong) {},
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                // bearing: 30,
                  target: LatLng(30, 30),
                  //tilt: 45,
                  zoom: 10),
              compassEnabled: true,
              markers: listMarkers,
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width*.05,
              top: MediaQuery.of(context).size.height*.7,
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width*.9,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: Colors.white,
                 ),
                child:Row(
                  children: [
                    Icon(Icons.location_on,color: Color(h.mainColor),),
                    SizedBox(width: 5,),
                    CustomText.btnText14(address, Colors.black)
                  ],
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.015,),
              GestureDetector(
                onTap: ()async{
                 // Navigator.push(context, GlobalFunction.route(ConfirmOrder()));
                  SharedPreferences pref=await SharedPreferences.getInstance();
                  Map<String,dynamic>data=await addressServices.addAddress(address, long, lat, pref.getString("UserId"));
                  Navigator.push(context, GlobalFunction.route(Address(this.items)));
                },
                child: Container(
                    height: MediaQuery.of(context).size.height*.065,
                    width: MediaQuery.of(context).size.width*.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(h.mainColor)
                    ),
                    padding: EdgeInsets.only(
                        left: 15,right: 15
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText.btnText(DemoLocalizations.of(context).title['confirm'], Colors.white),
                      ],
                    )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.03,),
            ],
          ))
        ],
      ),
    );
  }
  Future<void> getCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    await getCurrentLocation2();

    final CameraPosition position = CameraPosition(
      target: LatLng(this.lat, this.long),
      zoom: 15,
    );

    await controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }
  makeMarker() async {
    listMarkers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onDragEnd: (LatLng) async {
          this.changeLocation(LatLng.longitude, LatLng.latitude);
        },
        position: LatLng(this.lat, this.long),
        infoWindow: InfoWindow(title: "Current Location"),
        icon: BitmapDescriptor.defaultMarker));
    //  newPlace = await placemarkFromCoordinates(longitude,longitude);
  }

  changeLocation(double long, double lat) async {
 setState(() {
   this.long = long;
   this.lat = lat;
 });
    List<geocode.Placemark> placemarks =
    await geocode.placemarkFromCoordinates(this.lat, this.long);
    setState(() {
      this.address = placemarks[0].country + " " + placemarks[0].street;
    });
    this.makeMarker();

  }

  Future<void> getCurrentLocation2() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
     setState(() {
       this.lat = _locationData.latitude;
       this.long = _locationData.longitude;
     });
    List<geocode.Placemark> placemarks =
    await geocode.placemarkFromCoordinates(this.lat, this.long);
     setState(() {
       this.address = placemarks[0].country + " " + placemarks[0].street;
     });
    this.makeMarker();
  }
}