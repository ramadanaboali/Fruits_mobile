import 'dart:convert';

import 'package:http/http.dart' as http;

import 'GlobalVariable.dart';

class UserServices{
  String baseURL=GlobalVariable.URL;

  Future<Map<String,dynamic>>login(String lang,String phone,String password)async{
    String url=baseURL+"/api/people/login";
    print(url);
    var body={
      "phone" : phone,
      "password" : password,
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
  Future<Map<String,dynamic>>register(String lang,String name,String phone,String address,String email,String password)async{
    String url=baseURL+"/api/people/register";
    print(url);
    var body={
      "Name":name,
      "Email":email,
      "Phone":phone,
      "Address" : address,
      "Password":password
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
        return json.decode(responce.body);
      }

    }
    catch(e) {
      print(e.toString());
    }
  }



}