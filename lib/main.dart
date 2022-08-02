import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/auth_cubit.dart';
import 'package:flutter_application_1/cubit/laundry_service_cubit.dart';
import 'package:flutter_application_1/cubit/page_cubit.dart';
import 'package:flutter_application_1/ui/admin_pages/admin_home_page.dart';
import 'package:flutter_application_1/ui/pages/checkout_page.dart';
import 'package:flutter_application_1/ui/pages/main_page.dart';
import 'package:flutter_application_1/ui/pages/sign_in_page.dart';
import 'package:flutter_application_1/ui/pages/sign_up_page.dart';
import 'package:flutter_application_1/ui/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/quantity_cubit.dart';
import 'cubit/receipt_cubit.dart';
import 'cubit/transaction_cubit.dart';
import 'ui/admin_pages/admin_main_page.dart';
import 'ui/pages/success_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => LaundryServiceCubit()),
        BlocProvider(create: (context) => QuantityCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => ReceiptCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/main': (context) => MainPage(),
          '/success': (context) => SuccessPage(),
        },
      ),
    );
  }
}
