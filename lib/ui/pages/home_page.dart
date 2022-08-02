import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/auth_cubit.dart';
import 'package:flutter_application_1/cubit/laundry_service_cubit.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/custom_button.dart';
import 'package:flutter_application_1/ui/widgets/increment.dart';
import 'package:flutter_application_1/ui/widgets/laundry_service_card.dart';
import 'package:flutter_application_1/ui/widgets/service_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/laundry_service_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<LaundryServiceCubit>().fetchLaundryService();
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Haloo,\n${state.user.name}',
                          overflow: TextOverflow.ellipsis,
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Pilih layanan:',
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.fill)),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget laundryService(List<ServiceModel> destinations) {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: destinations.map((ServiceModel destination) {
                    return LaundryServiceCard(destination, state.user);
                  }).toList(),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget laundryServiceTile() {
      return Container(
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, bottom: 100),
        child: Column(
          children: [
            ServiceTile(
              title: 'Free Biaya Antar Jemput',
            ),
            ServiceTile(
              title: 'Free Lipat Baju',
            ),
            ServiceTile(
              title: 'Free Pewangi',
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: BlocConsumer<LaundryServiceCubit, LaundryServiceState>(
        listener: (context, state) {
          if (state is LaundryServiceFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is LaundryServiceSuccess) {
            return ListView(
              children: [
                header(),
                laundryService(state.destinations),
                laundryServiceTile()
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
