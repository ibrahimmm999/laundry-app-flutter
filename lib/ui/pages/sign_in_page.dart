import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/auth_cubit.dart';
import 'package:flutter_application_1/models/transaction_model.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/admin_pages/admin_main_page.dart';
import 'package:flutter_application_1/ui/widgets/custom_button.dart';
import 'package:flutter_application_1/ui/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final String role = 'user';
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Sign In',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextField(
          controller: emailController,
          title: 'Email',
          hintText: 'Masukkan Email',
        );
      }

      Widget passwordInput() {
        return CustomTextField(
          controller: passwordController,
          title: 'Password',
          hintText: 'Masukkan Password',
          obscureText: true,
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
          ],
        ),
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            if (state.user.role == 'admin') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminMainPage(state.user)));
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            }
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            onPressed: () {
              context.read<AuthCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,
                  role: role);
            },
            heightButton: 55,
            widthButton: 220,
            buttonText: 'Sign In',
          );
        },
      );
    }

    Widget signUpButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10, bottom: 73),
          child: Text(
            "don't have an account? Sign Up here",
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), inputSection(), submitButton(), signUpButton()],
        ),
      ),
    );
  }
}
