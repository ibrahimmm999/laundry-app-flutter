import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/auth_cubit.dart';
import 'package:flutter_application_1/cubit/transaction_cubit.dart';
import 'package:flutter_application_1/models/transaction_model.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/booking_details_item.dart';
import 'package:flutter_application_1/ui/widgets/custom_button.dart';
import 'package:flutter_application_1/ui/widgets/transaction_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin:
            EdgeInsets.only(top: 50, right: defaultMargin, left: defaultMargin),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'))),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: kBlackColor,
            )
          ],
        ),
      );
    }

    Widget details() {
      return Column(
        children: [
          TransactionCard(transaction),
          SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            'CILACAP',
            style: blueTextStyle.copyWith(
                fontWeight: semiBold, fontSize: 28, letterSpacing: 10),
          )),
          Center(
              child: Text(
            'LAUNDRY',
            style: blackTextStyle.copyWith(
                letterSpacing: 10, fontSize: 16, fontWeight: light),
          )),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: kBlackColor,
          )
        ],
      );
    }

    Widget nextButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
                child: CircularProgressIndicator(),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30));
          }
          return Container(
            margin: EdgeInsets.only(top: 24, right: 50, left: 50),
            child: CustomButton(
              onPressed: () {
                context.read<TransactionCubit>().createTransaction(transaction);
              },
              heightButton: 55,
              widthButton: 120,
              buttonText: 'Confirm',
            ),
          );
        },
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [header(), details(), nextButton()],
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
