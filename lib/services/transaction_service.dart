import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/transaction_model.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');
  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'name': transaction.name,
        'address': transaction.address,
        'weightOfLaundry': transaction.weightOfLaundry,
        'price': transaction.price,
        'isDone': transaction.isDone,
        'serviceName': transaction.serviceName,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
