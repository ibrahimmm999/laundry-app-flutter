import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/user.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'address': user.address,
        'phone': user.phone,
        'role': user.role,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          address: snapshot['address'],
          phone: snapshot['phone'],
          role: snapshot['role']);
    } catch (e) {
      throw e;
    }
  }
}
