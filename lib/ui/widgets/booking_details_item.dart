import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const BookingDetailsItem({Key? key, this.title = '', this.subtitle = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/checklist_icon.png'))),
          ),
          Text(
            title,
            style: blueTextStyle,
          ),
          Spacer(),
          Text(
            subtitle,
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          )
        ],
      ),
    );
  }
}
