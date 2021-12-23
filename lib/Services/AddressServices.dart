import 'dart:convert';
import 'package:fruits/Model/AddressModel.dart';
import 'package:fruits/Model/PaymentModel.dart';
import 'package:http/http.dart' as http;
import 'package:fruits/Model/SliderModel.dart';
import 'GlobalVariable.dart';

class AddressServices {
  var baseUrl = GlobalVariable.URL;
  Future<List<AddressDetail>> GetAddress(String lang, var id) async {
    var url = "${baseUrl}/api/addsress/get-all-addresses-by-userId?userId=$id";
    print(url);
    var header = {
      "lang": lang,
    };
    try {
      final response = await http.get(Uri.parse(url), headers: header);
      print(response.body);
      print(
          "555555555555555555555555555555555555555555555555555555555555555555555555555555555555555");
      if (response.statusCode == 200 && response.body != null) {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"];
        return slideritems.map((e) => AddressDetail.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<List<PaymentDetail>> GetPayment(String lang, String token) async {
    var url = "${baseUrl}/api/order/get-payment-methods";
    print(url);
    var header = {"lang": lang, "Authorization": "bearer $token"};
    print(header);
    print(
        "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
    try {
      final response = await http.get(Uri.parse(url), headers: header);
      print(response.body);
      print(
          "000000000000000000000000000000000000000000000000000000000000000000000");
      if (response.statusCode == 200 && response.body != null) {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"];
        return slideritems.map((e) => PaymentDetail.fromJson(e)).toList();
      }
    } catch (e) {
      print('$e,,,,error search doctors');
    }
  }

  Future<Map<String, dynamic>> addAddress(
      String address, double long, double lat, var user_id) async {
    String url = baseUrl + "/api/addsress/add-address";
    print(url);
    var body = {
      "Phone": "01145113953",
      "Address": address,
      "Longitude": long.toString(),
      "Latitude": lat.toString(),
      "Email": "alaa@gmail.com",
      "UserId": user_id
    };
    print(body);
    var header = {"Content-Type": "application/json", "lang": "en"};
    print(header);
    try {
      final responce = await http.post(Uri.parse(url),
          body: json.encode(body), headers: header);
      print(responce.body);
      print("0000000000000000000000000000000000000000000000000000000");
      if (responce.body.isNotEmpty) {
        print(responce.body);
        return json.decode(responce.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
