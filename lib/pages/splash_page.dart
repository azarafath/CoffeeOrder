import 'dart:ui';
import 'package:coffee_order/pages/order_page.dart';
import 'package:coffee_order/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/splash.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  Text(
                    'Sweet &\n Nice Coffee',
                    style: primaryTextStyle.copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Nice Coffee can change The\n atmosphere  in the morning',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 420,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 55,
                      width: 260,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OrderPage();
                          }));
                        },
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Text(
                          'ORDER NOW',
                          style: thirdTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
