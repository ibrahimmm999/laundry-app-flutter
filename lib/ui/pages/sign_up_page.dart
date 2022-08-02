import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/auth_cubit.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/widgets/custom_button.dart';
import 'package:flutter_application_1/ui/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController addressController =
      TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Sign Up',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextField(
          controller: nameController,
          title: 'Nama Lengkap',
          hintText: ' Masukkan Nama Lengkapmu',
        );
      }

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

      Widget addressInput() {
        return CustomTextField(
          controller: addressController,
          title: 'Alamat Lengkap',
          hintText: 'Masukkan Alamat Lengkap',
        );
      }

      Widget phoneInput() {
        return CustomTextField(
          controller: phoneController,
          title: 'Nomor Telepon',
          hintText: 'Masukkan No. telp',
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            addressInput(),
            phoneInput()
          ],
        ),
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
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
              context.read<AuthCubit>().signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  address: addressController.text,
                  phone: phoneController.text);
            },
            heightButton: 55,
            widthButton: 220,
            buttonText: 'Sign Up',
          );
        },
      );
    }

    Widget signInButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10, bottom: 73),
          child: Text(
            'Have an account? Sign In here',
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
          children: [title(), inputSection(), submitButton(), signInButton()],
        ),
      ),
    );
  }
}
