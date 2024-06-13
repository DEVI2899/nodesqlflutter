class OrderModel{
  final String id;
  final String title;
  final String quantity;
  final String message;
  final String city;

  OrderModel( { required this.id ,required this.title, required this.quantity, required this.message, required this.city});


  factory OrderModel.fromJson(Map<String, dynamic> json){
   return OrderModel(
      title: json['title'],
      quantity: json['quantity'],
      message: json['message'],
      city: json['city'],
      id: json['id'],
    );
  }
   Map<String , dynamic> toJson() =>
       {
         'title': title,
         'quantity': quantity,
         'message': message,
         'city': city,
         'id': id,
       };

}