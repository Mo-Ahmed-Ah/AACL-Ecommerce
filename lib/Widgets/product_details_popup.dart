import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/cart_screen.dart';
import 'package:flutter_ecommerce/Widgets/container_button_modal.dart';

// ignore: must_be_immutable
class ProductDetailsPopup extends StatelessWidget {
  final istyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  List<Color> colors = [Colors.red, Colors.indigo, Colors.green, Colors.amber];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder:
              (context) => Container(
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Size : ", style: istyle),
                              SizedBox(height: 20),
                              Text("Color : ", style: istyle),
                              SizedBox(height: 20),
                              Text("Total : ", style: istyle),
                              SizedBox(height: 20),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text("S", style: istyle),
                                  SizedBox(width: 30),
                                  Text("M", style: istyle),
                                  SizedBox(width: 30),
                                  Text("L", style: istyle),
                                  SizedBox(width: 30),
                                  Text("XL", style: istyle),
                                  SizedBox(width: 30),
                                ],
                              ),
                              SizedBox(height: 18),
                              Container(
                                child: Row(
                                  children: [
                                    for (int i = 0; i < 4; i++)
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 6,
                                        ),

                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                          color: colors[i],
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text("-", style: istyle),
                                  SizedBox(width: 30),
                                  Text("1", style: istyle),
                                  SizedBox(width: 30),
                                  Text("+", style: istyle),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Price :", style: istyle),
                          Text(
                            '\$ 100.00',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDB3022),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                          );
                        },
                        child: ContainerButtonModal(
                          containerwidth: MediaQuery.of(context).size.width,
                          itext: "Checkout",
                          bgColor: Color(0xFFDB3022),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
      },

      child: ContainerButtonModal(
        containerwidth: MediaQuery.of(context).size.width / 1.5,
        itext: "Buy Now",
        bgColor: Color(0xFFDB3022),
      ),
    );
  }
}
