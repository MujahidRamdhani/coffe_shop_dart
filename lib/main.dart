import 'package:coffe_shop_flutter/Pages/dashboard_page.dart';
import 'package:coffe_shop_flutter/Pages/detail_page.dart';
import 'package:coffe_shop_flutter/Pages/onboard_page.dart';
import 'package:coffe_shop_flutter/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF9F9F9),
          textTheme: GoogleFonts.soraTextTheme(),
        ),
        home: const OnboardPage(),
        routes: {
          '/dashboard': (context) => DashboardPage(),
          '/detail': (context) {
            Coffee coffe = ModalRoute.of(context)!.settings.arguments as Coffee;
            return DetailPage(coffee: coffe);
          },
        });
  }
}
