import 'package:coffe_shop_flutter/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child:  Image.asset('assets/bg.png'),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                       Color(0xff050505),
                       Color(0xff050505),
                       Color(0xff050505),
                       Color(0xff050505),
                    ],
                  ),
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40),
                  Text('Fail in love with coffee in blissful delight!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Color(0xffFFFFFF),
                    height: 1.5,
                  ), 
                ),
                SizedBox(height: 8),
                Text('welcome to our cozy coffe corner, where every cup is a delightful for you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Color(0xffA2A2A2),
                  ), 
                ),
                SizedBox(height: 30),
                ButtonPrimary(
                  title: 'Get Started', 
                  onTap: (){
                    Navigator.pushNamed(context, '/dashboard');
                  }
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
