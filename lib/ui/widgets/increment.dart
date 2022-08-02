import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/quantity_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class Increment extends StatefulWidget {
  final int price;
  Increment(this.price, {Key? key}) : super(key: key);

  @override
  State<Increment> createState() => _IncrementState();
}

class _IncrementState extends State<Increment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuantityCubit, List<String>>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text(
                '${state.length.toString()} Kg',
                style:
                    blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (state.length > 0) {
                          setState(() {
                            context.read<QuantityCubit>().decrementQuantity();
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          context.read<QuantityCubit>().incrementQuantity('x');
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: 30,
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: defaultMargin),
                child: Row(
                  children: [
                    Text(
                      'Total Harga:  ',
                      style: blackTextStyle.copyWith(
                          fontSize: 13, fontWeight: light),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(state.length * widget.price),
                      style: blueTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
    ;
  }
}
