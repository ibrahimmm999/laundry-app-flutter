import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/ui/widgets/booking_details_item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubit/auth_cubit.dart';
import '../../models/transaction_model.dart';
import '../../shared/theme.dart';

class TransactionCardAdmin extends StatefulWidget {
  final TransactionModel transaction;
  const TransactionCardAdmin(this.transaction, {Key? key}) : super(key: key);

  @override
  State<TransactionCardAdmin> createState() => _TransactionCardAdminState();
}

class _TransactionCardAdminState extends State<TransactionCardAdmin> {
  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      if (widget.transaction.isDone) {
        return kPrimaryColor;
      } else {
        return kRedColor;
      }
    }

    child() {
      if (widget.transaction.isDone) {
        return Text(
          'Sudah Selesai',
          style: whiteTextStyle.copyWith(fontSize: 11, fontWeight: medium),
        );
      } else {
        return Text(
          'Belum Selesai',
          style: whiteTextStyle.copyWith(fontSize: 11, fontWeight: medium),
        );
      }
    }

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Details',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Spacer(),
                    Container(
                      width: 150,
                      height: 30,
                      child: TextButton(
                          onPressed: () {
                            if (widget.transaction.isDone == true) {
                              setState(() {
                                final docTransaction = FirebaseFirestore
                                    .instance
                                    .collection('transactions')
                                    .doc(widget.transaction.id);
                                docTransaction.update({'isDone': false});

                                //widget.transaction.isDone = false;
                              });
                            } else {
                              setState(() {
                                final docTransaction = FirebaseFirestore
                                    .instance
                                    .collection('transactions')
                                    .doc(widget.transaction.id);
                                docTransaction.update({'isDone': true});

                                //widget.transaction.isDone = true;
                              });
                            }
                          },
                          child: child(),
                          style: TextButton.styleFrom(
                              backgroundColor: backgroundColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius)))),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                BookingDetailsItem(
                  title: 'Name',
                  subtitle: widget.transaction.name,
                ),
                BookingDetailsItem(
                  title: 'Alamat',
                  subtitle: widget.transaction.address,
                ),
                BookingDetailsItem(
                  title: 'Layanan',
                  subtitle: widget.transaction.serviceName,
                ),
                BookingDetailsItem(
                  title: 'Berat Laundry',
                  subtitle: '${widget.transaction.weightOfLaundry} Kg',
                ),
                BookingDetailsItem(
                  title: 'Harga Laundry',
                  subtitle: NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(widget.transaction.price),
                ),
                BookingDetailsItem(
                  title: 'Biaya Pengiriman',
                  subtitle: '0',
                ),
                BookingDetailsItem(
                  title: 'Total',
                  subtitle: NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(widget.transaction.price),
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
