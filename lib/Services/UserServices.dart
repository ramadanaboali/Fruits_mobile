import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits/Model/NotificationModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'GlobalVariable.dart';

class UserServices{
  String baseURL=GlobalVariable.URL;

  Future<Map<String,dynamic>>login(String lang,String phone,String password,String deviceToken)async{
    String url=baseURL+"/api/people/login";
    print(url);
    var body={
      "phone" : phone,
      "password" : password,
      "deviceToken":deviceToken
    };
    print(body);
    var header={
      "Content-Type":"application/json",
      "lang":lang
    };
    print(header);
    try{
      final responce=await http.post(Uri.parse(url),body:json.encode(body),headers: header);
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if(responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>register(String lang,String name,String phone,String address,String email,String password,String gender,String deviceToken)async{
    String url=baseURL+"/api/people/register";
    print(url);
    var body={
      "Name":name,
      "Email":email,
      "Phone":phone,
      "Address" : address,
      "Password":password,
      "Gender":gender,
      "deviceToken":deviceToken
    };
    print(body);
    var header={
      "Content-Type":"application/json",
      "lang":lang
    };
    print(header);
    try{
      final responce=await http.post(Uri.parse(url),body:json.encode(body),headers: header);
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if(responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>getUserData(String lang,String id)async{
    String url=baseURL+"/api/home/get-profile?id=$id";
    var header={
      "Content-Type":"application/json",
      "lang":lang
    };
    print(header);
    try{
      final responce=await http.get(Uri.parse(url),headers: header);
      print(responce.body);
      print("000000000000000000000000000000000000000");
      if(responce.body.isNotEmpty)
      {
        print(responce.body);
        return json.decode(responce.body)["data"];
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<Map<String,dynamic>>updateProfile(var id,var name,var email,var phone)async{
    String url="$baseURL/api/home/edit-profile";
    print(url);
    var body={
      "id":id,
      "Name":name,
      "email":email,
      "phone":phone
    };
    print(body);
    var header={
      "Content-Type":"application/json",
      "lang":"en"
    };
    try{
      final responce=await http.post(Uri.parse(url),body:json.encode(body),headers: header);
      print(responce.body);
      print("0000000000000000000000000000000000000000000000000000000000000000");
      if(responce.statusCode==200 && responce.body.isNotEmpty)
      {
        print(responce.body);
        print("8888888888888888888888888888888888888888888888888888888888888888");
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }
  static updateAvatar(File fileImage,BuildContext context,var user_id)async
  {
    if (fileImage != null) {
      try {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        Dio dio = Dio();
        ///we used uri.encode to enable upload  image with arabic name
        // var url =Uri.encodeFull(createPath('user/editProfileImage'));
        var url = GlobalVariable.URL+"/API/home/edit-profile-photo";
        print(url);
        String fileName = basename(fileImage.path);
        // print('${fileName},,,,fileName');
        //print('${pathImage.path},,,,imagePath.path');
        FormData formData = FormData.fromMap({
          "File": await MultipartFile.fromFile(
              fileImage.path, filename: fileName
              , contentType: MediaType('image', fileName
              .split('.')
              .last)),
          "UserId": user_id,
        });
        print(formData.fields);
        print("ssssssssssssssssss");
        Response response = await dio.post(url, data: formData);
        print('${response.data},,,,,,,,fields');
        print("dddddddddddddddddddddddddddddddddddddddddddddddddddddd");
        if (response.statusCode == 200) {
          Toast.show(
              "  تم تغير صورة الملف الشخصي ", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
        else {
          Toast.show(
              " فشل في تغير صورة الملف الشخصي ", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          return null;
        }
      }
      catch (e) {
        print('${e}imageuploaderror');
      }
    }
  }
  Future<List<NotificationDetail>>GetNotification(var id)async
  {
    var url="${baseURL}/api/notifications/get-all-notifications?userId=9f8487f1-f49a-4d24-b700-3dd222ed8aa8";
    print(url);
    try
    {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"];
        return slideritems.map((e) => NotificationDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }



}