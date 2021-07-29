import 'dart:io';

import 'package:coffee_order/pages/splash_page.dart';
import 'package:coffee_order/theme.dart';
import 'package:flutter/material.dart';

class SuccesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'images/shipment.png',
                width: 300,
                height: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Yay, the order is in progress for delivery ',
              style: primaryTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 200,
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
                      return SplashPage();
                    }));
                  },
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text(
                    'BACK TO MENU',
                    style: thirdTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                width: 260,
                child: RaisedButton(
                  onPressed: () => exit(0),
                  color: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text(
                    'EXIT',
                    style: thirdTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
