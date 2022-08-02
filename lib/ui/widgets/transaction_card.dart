import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/booking_details_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/auth_cubit.dart';
import '../../models/transaction_model.dart';
import '../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Details',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 20,
                ),
                BookingDetailsItem(
                  title: 'Name',
                  subtitle: transaction.name,
                ),
                BookingDetailsItem(
                  title: 'Alamat',
                  subtitle: transaction.address,
                ),
                BookingDetailsItem(
                  title: 'Layanan',
                  subtitle: transaction.serviceName,
                ),
                BookingDetailsItem(
                  title: 'Berat Laundry',
                  subtitle: '${transaction.weightOfLaundry} Kg',
                ),
                BookingDetailsItem(
                  title: 'Harga Laundry',
                  subtitle: NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(transaction.price),
                ),
                BookingDetailsItem(
                  title: 'Biaya Pengiriman',
                  subtitle: '0',
                ),
                BookingDetailsItem(
                  title: 'Total',
                  subtitle: NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(transaction.price),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
