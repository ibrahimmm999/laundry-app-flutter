import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final String name;
  final String id;
  final int price;
  final String imageUrl;

  const ServiceModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.imageUrl});
  factory ServiceModel.fromJson(String id, Map<String, dynamic> json) =>
      ServiceModel(
          name: json['name'],
          id: id,
          price: json['price'],
          imageUrl: json['imageUrl']);
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, price, imageUrl];
}
