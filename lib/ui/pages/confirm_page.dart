import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/laundry_service_model.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/pages/detail_page.dart';
import 'package:flutter_application_1/ui/widgets/custom_button.dart';

class ConfirmPage extends StatelessWidget {
  final UserModel user;
  final ServiceModel destination;
  const ConfirmPage(this.destination, this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget confirmButton() {
      return Container(
        child: CustomButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => DetailPage(destination, user))));
          },
          buttonText: 'Confirm',
          heightButton: 55,
          widthButton: double.infinity,
        ),
        margin: EdgeInsets.symmetric(horizontal: 50),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: NetworkImage(destination.imageUrl)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Apakah Anda akan menggunakan\nlayanan ${destination.name}?',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            confirmButton()
          ],
        ),
      ),
    );
  }
}
