import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/page_cubit.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/shared/theme.dart';
import 'package:flutter_application_1/ui/admin_pages/admin_home_page.dart';
import 'package:flutter_application_1/ui/admin_pages/transaction_page.dart';
import 'package:flutter_application_1/ui/pages/log_out_page.dart';
import 'package:flutter_application_1/ui/widgets/custom_bottom_nav_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminMainPage extends StatelessWidget {
  final UserModel user;
  const AdminMainPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return AdminHomePage(user);
        case 1:
          return TransactionPage();
        default:
          return AdminHomePage(
            user,
          );
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 200,
          height: 60,
          margin: EdgeInsets.only(
              bottom: 30, left: defaultMargin, right: defaultMargin),
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            CustomButtonNavItem(
              index: 0,
              imageUrl: 'assets/user_logo.png',
            ),
            CustomButtonNavItem(
                index: 1, imageUrl: 'assets/bottom_nav_logo.png')
          ]),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [buildContent(currentIndex), customBottomNavigation()],
          ),
        );
      },
    );
  }
}
