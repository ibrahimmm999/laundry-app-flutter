import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/laundry_service_model.dart';

class LaundryService {
  final CollectionReference _destinationRef =
      FirebaseFirestore.instance.collection('services');

  Future<List<ServiceModel>> fetchLaundryService() async {
    try {
      QuerySnapshot result = await _destinationRef.get();
      List<ServiceModel> destinations = result.docs.map(
        (e) {
          return ServiceModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();
      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
