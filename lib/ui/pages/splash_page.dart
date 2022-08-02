import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/auth_cubit.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      User? user = FirebaseAuth.instance.currentUser;
      Navigator.pushNamedAndRemoveUntil(context, '/sign-up', (route) => false);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'))),
            ),
            Text(
              'CILACAP',
              style: blueTextStyle.copyWith(
                fontSize: 32,
                letterSpacing: 10,
                fontWeight: bold,
              ),
            ),
            Text('LAUNDRY',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  letterSpacing: 10,
                  fontWeight: medium,
                )),
          ],
        ),
      ),
    );
  }
}
