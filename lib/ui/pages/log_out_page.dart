import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/auth_cubit.dart';
import 'package:flutter_application_1/cubit/page_cubit.dart';
import 'package:flutter_application_1/ui/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
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
      ),
    );
  }
}
