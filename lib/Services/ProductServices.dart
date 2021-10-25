import 'dart:convert';
import 'package:fruits/Model/OrderModel.dart';
import 'package:http/http.dart' as http;
import 'package:fruits/Model/ProductModel.dart';
import 'GlobalVariable.dart';
import 'package:fruits/Model/CategoryModel.dart';

class ProductServices{
  var baseUrl=GlobalVariable.URL;
  Future<List<ProductDetail>>GetAdvertisment(String lang)async
  {
    var url="${baseUrl}/api/home/get-advertisment-products";
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["products"];
        return slideritems.map((e) => ProductDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<ProductDetail>>GetOffers(String lang)async
  {
    var url="${baseUrl}/api/home/get-offered-products";
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["products"];
        return slideritems.map((e) => ProductDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<ProductDetail>>GetBestSeller(String lang)async
  {
    var url="${baseUrl}/api/home/get-best-seller-products";
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["products"];
        return slideritems.map((e) => ProductDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<CategoryModelDetail>>CatAllCategory(String lang)async
  {
    var url="${baseUrl}/api/categories/get-all-categories";
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["categories"];
        return slideritems.map((e) => CategoryModelDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<ProductDetail>>CatCategoryProduct(String lang,var id)async
  {
    var url="${baseUrl}/api/home/get-all-products-by-category?catId=$id";
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["products"];
        return slideritems.map((e) => ProductDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<ProductDetail>>SearchProduct(String lang,var key)async
  {
    String url=baseUrl+"/api/home/search?searchValue=$key";
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      print(response.body);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["productDetailsVMs"];
        return slideritems.map((e) => ProductDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<CategoryModelDetail>>SearchCategory(String lang,var key)async
  {
    String url=baseUrl+"/api/home/search?searchValue=$key";
    var header={
      "lang":lang,
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["categoryVMs"];
        return slideritems.map((e) => CategoryModelDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<Map<String,dynamic>>SearchProduct1(String lang,String key)async{
    String url=baseUrl+"/api/home/search?searchValue=$key";
    print(url);
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
  Future<Map<String,dynamic>>addOrders(String token,String lang,String user_id,double total,String address_id,List orderItem,String paymentMethod,String DeliveredTime)async
  {
    //   Map<String, dynamic> result = Map.fromIterable(orderItem, key: (v) => v.ProductId.toString(), value: (v) => v.Quantity.toString());
    var url="${baseUrl}/api/order/add-order";
    print("4444444444444444444444444444444");
    print(url);
    var header={
      "Content-Type":"application/json",
      "lang":lang,
      "Authorization":"bearer $token"
    };
    print(header);
    var body={
      "UserId":user_id,
      "TotalPrice":total,
      "ChargeAddressId":address_id,
      "PaymentMethodId":paymentMethod,
      "DeliveredTime":DeliveredTime,
      "CreatingOrderItemVMs" :orderItem
    };
    print(body);
    try
    {
      final response = await http.post(Uri.parse(url),body:json.encode(body),headers: header);
      print(response.body);
      print("00000000000000000000000000000000000000000000000000000000000000000");
      if(response.statusCode==200 && response.body!=null)
      {
        print("4444444444444444444444444");
        return json.decode(utf8.decode(response.bodyBytes));
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<OrderDetail>>GetRecentOrder(String lang,var id,String token)async{
    String url=baseUrl+"/api/order/get-recent-orders-by-userId?userId=$id";
    print(url);
    var header={
      "lang":lang,
      "Authorization":"bearer $token"
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      print(response.body);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["orders"];
        return slideritems.map((e) => OrderDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
  Future<List<OrderDetail>>GetLastOrder(String lang,var id,String token)async{
    String url=baseUrl+"/api/order/get-last-orders-by-userId?userId=$id";
    var header={
      "lang":lang,
      "Authorization":"bearer $token"
    };
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      print(response.body);
      if(response.statusCode==200 && response.body!=null)
      {
        List slideritems = json.decode(utf8.decode(response.bodyBytes))["orders"];
        return slideritems.map((e) => OrderDetail.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print('$e,,,,error search doctors');
    }
  }
}