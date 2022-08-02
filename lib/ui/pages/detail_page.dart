import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/quantity_cubit.dart';
import 'package:flutter_application_1/models/laundry_service_model.dart';
import 'package:flutter_application_1/models/transaction_model.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/pages/checkout_page.dart';
import 'package:flutter_application_1/ui/widgets/increment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_button.dart';

class DetailPage extends StatelessWidget {
  final UserModel user;
  final ServiceModel destination;
  const DetailPage(this.destination, this.user, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, bottom: 30),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/detail_icon.png'))),
          ),
          Text(
            'Berat Laundry: ',
            style: blackTextStyle.copyWith(fontSize: 16),
          )
        ],
      );
    }

    Widget content() {
      return BlocBuilder<QuantityCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Increment(destination.price),
              ],
            ),
          );
        },
      );
    }

    Widget checkOutButton() {
      return BlocBuilder<QuantityCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: CustomButton(
              onPressed: () {
                if (state.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutPage(TransactionModel(
                              name: user.name,
                              serviceName: destination.name,
                              isDone: false,
                              address: user.address,
                              price: state.length * destination.price,
                              weightOfLaundry: state.length))));
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                }
              },
              widthButton: double.infinity,
              heightButton: 55,
              buttonText: 'CheckOut',
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin),
        child: Column(
          children: [logo(), content(), checkOutButton()],
        ),
      ),
    );
  }
}
