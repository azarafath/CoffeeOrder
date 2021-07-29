import 'package:coffee_order/pages/succes_page.dart';
import 'package:coffee_order/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/rendering.dart';

StreamController<int> streamController = StreamController<int>.broadcast();

class CheckoutButton extends StatefulWidget {
  CheckoutButton(this.stream);
  final Stream<int> stream;
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  String menuName = 'Small';
  String price = '20.000';
  void initState() {
    super.initState();
    widget.stream.listen((index) {
      mySetState(index);
    });
  }

  void mySetState(int index) {
    List menuList = ['Small', 'Medium', 'Large'];
    setState(() {
      menuName = menuList[index];
    });
    List priceList = ['20.000', '35.000', '40.000'];
    setState(() {
      price = priceList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        height: 55,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: primaryColor,
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              context: context,
              builder: (context) {
                return Container(
                  height: 350,
                  color: whiteColor,
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            menuName + ' Caramel Macchiato',
                            style: primaryTextStyle.copyWith(fontSize: 22),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'IDR ' + price,
                            style: secondaryTextStyle.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 315,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: bgColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.money_off,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    ' Free Delivery',
                                    style: secondaryTextStyle.copyWith(
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    ' 20-30',
                                    style: secondaryTextStyle.copyWith(
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    ' 4.5  ',
                                    style: secondaryTextStyle.copyWith(
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Description',
                              style: primaryTextStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                            )),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              'We will send according to your gps location, please stay at your place, and make a COD payment when it arrives.',
                              style: secondaryTextStyle.copyWith(
                                  fontWeight: FontWeight.normal),
                            )),
                        SizedBox(
                          height: 28,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 300,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SuccesPage();
                                }));
                              },
                              child: Text(
                                'CHECKOUT',
                                style: thirdTextStyle.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            // RaisedButton(

                            //     color: primaryColor,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(16),
                            //     ),
                            //     onPressed: () {
                            //       Navigator.push(context,
                            //           MaterialPageRoute(builder: (context) {
                            //         return SuccesPage();
                            //       }));
                            //     },
                            //     child: Text(
                            //       'CHECKOUT',
                            //       style: thirdTextStyle.copyWith(
                            //         fontSize: 14,
                            //       ),
                            //     )),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            'CHECKOUT NOW',
            style: thirdTextStyle.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
