import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/transaction_cubit.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/transaction_card_admin.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionSuccess) {
            if (state.transactions.isEmpty) {
              return Center(
                child: Text('Orderan kosong'),
              );
            } else {
              return ListView.builder(
                  itemCount: state.transactions.length,
                  itemBuilder: ((context, index) {
                    return TransactionCardAdmin(state.transactions[index]);
                  }));
            }
          }
          return Center();
        },
      ),
    );
  }
}
