import 'package:coffee_order/theme.dart';
import 'package:coffee_order/widgets/checkout_widget.dart';
import 'package:coffee_order/widgets/fav_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

StreamController<int> streamController = StreamController<int>.broadcast();

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Coffee Details',
                      style: primaryTextStyle.copyWith(fontSize: 15),
                    ),
                    FavoriteButton(),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/product1.png',
                      height: 290,
                      width: 220,
                    ),
                    Text(
                      'Caramel Macchiato',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'We cannot guarantee that any unpackaged\n products served in our stores are allergen-free',
                      style: secondaryTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizeButton(),
              SizedBox(
                height: 35,
              ),
              CheckoutButton(streamController.stream),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeButton extends StatefulWidget {
  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'SIZE',
                style: primaryTextStyle.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            LayoutBuilder(
              builder: (context, constraints) => ToggleButtons(
                selectedColor: Colors.white,
                focusColor: Colors.green,
                constraints:
                    BoxConstraints.expand(width: constraints.maxWidth / 3.038),
                fillColor: primaryColor,
                disabledColor: Colors.transparent,
                selectedBorderColor: primaryColor,
                borderColor: primaryColor,
                borderRadius: BorderRadius.circular(6),
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'S',
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'M',
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'L',
                      ),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                  streamController.add(index);
                },
                isSelected: isSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
