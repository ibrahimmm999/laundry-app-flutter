import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String address;
  final String phone;
  final String role;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.address,
    required this.phone,
    required this.role,
  });

  @override
  List<Object?> get props => [id, email, name, address, phone, role];
}
