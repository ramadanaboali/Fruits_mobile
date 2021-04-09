import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fruits/Model/SliderModel.dart';
import 'GlobalVariable.dart';

class ConfigServices{
var baseUrl=GlobalVariable.URL;
  Future<List<SliderModelDetail>>SliderServices(String lang)async
  {
    var url="${baseUrl}/api/sliders/get-sliders";
    var uri;
    print(url);
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
}