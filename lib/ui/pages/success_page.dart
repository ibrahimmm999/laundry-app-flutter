import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
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
            margin: EdgeInsets.only(bottom: 26),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/scheduling.png'))),
          ),
          Text(
            'Yeayy 😍',
            style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 36),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Pakaianmu akan bersih dan\nwangi seperti baru',
            style: whiteTextStyle.copyWith(fontWeight: light, fontSize: 18),
            textAlign: TextAlign.center,
          )
        ],
      )),
      backgroundColor: kPrimaryColor,
    );
  }
}
