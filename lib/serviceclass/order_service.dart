import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:node_mongodb/model/ordermodel.dart';

class OrderService{
   static const url = 'http://10.0.2.2:8090/api/orders';


    Future<List<OrderModel>> fetchItems() async {
     final response = await http.get(Uri.parse(url));

     if (response.statusCode == 200) {
       List<dynamic> data = json.decode(response.body);
       return data.map((item) => OrderModel.fromJson(item)).toList();

     } else {
       throw Exception("Failed to fetch items");
     }
   }

   Future<OrderModel> postOrders(OrderModel orderData) async {
     final response = await http.post(Uri.parse(url),
         headers: {
           'Content-Type': 'application/json',
         },
         body: jsonEncode(orderData.toJson())
     );
       if(response.statusCode ==201){
          final dynamic json = jsonDecode(response.body);
          final OrderModel orders= OrderModel.fromJson(json);
          return orders;

       }else {
         throw Exception("Failed to create orders");
       }
   }

   Future<OrderModel> addItem(OrderModel orderData) async {
     final response = await http.post(Uri.parse(url),
         headers: {
           'Content-Type': 'application/json',
         },
         body: jsonEncode(orderData.toJson()));

     if (response.statusCode == 201) {
       final dynamic json = jsonDecode(response.body);
       final OrderModel orderData= OrderModel.fromJson(json);
       return orderData;
     } else {
       throw Exception('Failed to add item');
     }
   }

   Future<void> updateItem(OrderModel orderData) async {
     final response = await http.put(
       Uri.parse('$url/${orderData.id}'),
       headers: {'Content-Type': 'application/json'},
       body: jsonEncode(orderData.toJson()),
     );
     if (response.statusCode != 200) {
       throw Exception('Failed to update item');
     }
   }

   Future<void> deleteItem(int id) async {
     final response = await http.delete(Uri.parse('$url/$id'));
     if (response.statusCode != 200) {
       throw Exception('Failed to delete item');
     }
   }
}
