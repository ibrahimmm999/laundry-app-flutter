import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme.dart';

class ServiceTile extends StatelessWidget {
  final String title;
  const ServiceTile({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
      child: Row(children: [
        Icon(
          Icons.check_circle_outline,
          size: 30,
          color: kPrimaryColor,
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        )
      ]),
    );
  }
}
