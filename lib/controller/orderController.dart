
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:node_mongodb/serviceclass/order_service.dart';

import '../model/ordermodel.dart';

class Ordercontroller extends ChangeNotifier {
  List<OrderModel> _ordermodel = [];
  List<OrderModel> get orderdata => _ordermodel;
  OrderService orderService = OrderService();

  Future <void> fetchOrders()async {
    try {
      _ordermodel = await orderService.fetchItems();
      notifyListeners();
    }catch(e){
      throw Exception('Failed to fetch orders :$e');
    }

  }

 //  Future<void> postOrders(OrderModel orderDetails)async {
 // //   try {
 //      OrderModel newOrders = OrderModel(
 //          id: orderDetails.id,
 //          title: orderDetails.title,
 //          quantity: orderDetails.quantity,
 //          message: orderDetails.message,
 //          city: orderDetails.city);
 //      OrderModel createOrders = await orderService.postOrders(newOrders);
 //      _ordermodel.add(createOrders);
 //      notifyListeners();
 //    // }catch(e){
 //    //   throw Exception('Failed to create orders :$e');
 //    // }
 //  }
  Future<void> postOrders(String id ,String title, String quantity, String message, String city)async {
    OrderModel newOrders = OrderModel(id: id, title: title, quantity: quantity, message: message, city: city);
    OrderModel createOrders = await orderService.postOrders(newOrders);
    _ordermodel.add(createOrders);
    notifyListeners();
  }

  Future<void> updateItem(OrderModel orderData) async {
    try {
      await orderService.updateItem(orderData);
      final index = _ordermodel.indexWhere((element) => element.id == orderData.id);
      if (index != -1) {
        _ordermodel[index] = orderData;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteItem(int id) async {
    try {
      await orderService.deleteItem(id);
      _ordermodel.removeWhere((item) => item.id == id);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}


