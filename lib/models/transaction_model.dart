import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/laundry_service_model.dart';

class TransactionModel extends Equatable {
  final String name;
  final String id;
  final String address;
  final int weightOfLaundry;
  final int price;
  bool isDone;
  final String serviceName;

  TransactionModel(
      {required this.name,
      this.id = '',
      required this.serviceName,
      this.isDone = false,
      required this.address,
      this.weightOfLaundry = 0,
      this.price = 0});

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
          name: json['name'],
          address: json['address'],
          id: id,
          serviceName: json['serviceName'],
          price: json['price'],
          isDone: json['isDone'],
          weightOfLaundry: json['weightOfLaundry']);

  @override
  // TODO: implement props
  List<Object?> get props => [name, address, weightOfLaundry, price, isDone];
}
