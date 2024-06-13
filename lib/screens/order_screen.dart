import 'package:flutter/material.dart';
import 'package:node_mongodb/controller/orderController.dart';
import 'package:node_mongodb/model/ordermodel.dart';
import 'package:node_mongodb/screens/oreder_details.dart';
import 'package:provider/provider.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController IdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController cityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final orderInfo = Provider.of<Ordercontroller>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('OrderScreenDetails'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: IdController,
                decoration:  InputDecoration(
                  labelText: 'Enter the id ',
                  labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  ),
                  hintText: 'Title',
                  hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  //errorText: 'Enter the correct value'
                ),


              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: titleController,
                decoration:  InputDecoration(
                    labelText: 'Enter the Title',
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                    ),
                    hintText: 'Title',
                    hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                  //errorText: 'Enter the correct value'
                ),


              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: quantityController,
                decoration:  InputDecoration(
                    labelText: 'Enter the Quantity',
                    labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    hintText: 'Quantity',
                    hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                 //   errorText: 'Enter the correct value'
                ),


              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: messageController,
                decoration:  InputDecoration(
                    labelText: 'Enter the message',
                    labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    hintText: 'Title',
                    hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                  //  errorText: 'Enter the correct value'
                ),


              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: cityController,
                decoration:  InputDecoration(
                    labelText: 'Enter the city',
                    labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    hintText: 'City',
                    hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                   // errorText: 'Enter the correct value'
                ),


              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              final neworders = OrderModel(
                  id:DateTime.now().toString(),
                  title: titleController.text,
                  quantity: quantityController.text,
                  message: messageController.text,
                  city: cityController.text
              );
              orderInfo.postOrders(IdController.text, titleController.text,
                   quantityController.text, messageController.text, cityController.text);
            },

                style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.purple
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white),)
            ),
            ElevatedButton(onPressed: (){
             // orderInfo.fetchOrders();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetails()));
            }, child: const Text(
              'Fetch Data'
            ))
          ],
        ),
      ),
    )
    );
  }


}
