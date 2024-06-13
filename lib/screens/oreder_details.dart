import 'package:flutter/material.dart';
import 'package:node_mongodb/controller/orderController.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final orderController = Provider.of<Ordercontroller>(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: const Text('OrderDetails'),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: orderController!.fetchOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                    itemCount: orderController.orderdata.length,
                    itemBuilder: (context, index) {
                      final orders = orderController.orderdata[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(orders.id),
                        ),
                        title: Text(orders.title),
                        subtitle: Column(
                          children: [
                            Text(orders.message),
                            Text(orders.city),
                          ],
                        ),
                      );
                    }
                );
              }
            }
          )
        ));
  }
}
