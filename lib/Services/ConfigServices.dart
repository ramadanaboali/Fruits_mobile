import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fruits/Model/SliderModel.dart';
import 'GlobalVariable.dart';

class ConfigServices{
var baseUrl=GlobalVariable.URL;
  Future<List<SliderModelDetail>>SliderServices(String lang)async
  {
    var url="${baseUrl}/api/sliders/get-sliders";
    print(url);
    print("00000000000000000000000000000");
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["sliders"];
        return slideritems.map((e) => SliderModelDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<Map<String,dynamic>>getSetting(String lang)async
  {
  String url=baseUrl+"/api/settings/get-settings";
  var header={
    "Content-Type":"application/json",
    "lang":lang
  };
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