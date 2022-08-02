import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/laundry_service_model.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/ui/pages/confirm_page.dart';

import '../../shared/theme.dart';
import '../pages/detail_page.dart';

class LaundryServiceCard extends StatelessWidget {
  final ServiceModel destination;
  final UserModel user;
  const LaundryServiceCard(
    this.destination,
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ConfirmPage(destination, user))),
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(left: defaultMargin),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 160,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(18),
                  image: DecorationImage(
                      image: NetworkImage(destination.imageUrl))),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  Text(
                    '${destination.price.toString()}/Kg',
                    style: greyTextStyle.copyWith(fontWeight: light),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
