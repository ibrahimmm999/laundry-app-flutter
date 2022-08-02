import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/shared/theme.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';
import '../../cubit/page_cubit.dart';
import '../widgets/custom_button.dart';

class AdminHomePage extends StatefulWidget {
  final UserModel user;
  const AdminHomePage(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget logOut() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ));
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              child: CustomButton(
                  heightButton: 55,
                  widthButton: double.infinity,
                  buttonText: 'Log Out',
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                  }),
            ),
          );
        },
      );
    }

    return Scaffold(
        body: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 50, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Haloo,\nAdmin',
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 180,
                ),
              ],
            )),
        Center(
          child: logOut(),
        )
      ],
    ));
  }
}
