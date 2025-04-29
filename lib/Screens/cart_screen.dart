import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/payment_method_screen.dart';
import 'package:flutter_ecommerce/Widgets/container_button_modal.dart';

class CartScreen extends StatelessWidget {
  List images = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
  ];

  List productTitles = [
    "Warm Zipper",
    "Kintted Woo!",
    "Zipper Win",
    "Child Win",
  ];

  List productPrices = ["\$ 20.00", "\$ 25.00", "\$ 30.00", "\$ 35.00"];

  // List productReviews = ["4.5", "4.0", "3.5", "4.8"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            splashRadius: 20,
                            activeColor: Color(0xFFDB3022),
                            value: true,
                            onChanged: (val) {},
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              images[index],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productTitles[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Hodded Jacket",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black26,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                productPrices[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFDB3022),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.minus, color: Colors.green),
                              SizedBox(width: 20),
                              Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                CupertinoIcons.plus,
                                color: Color(0xFFDB3022),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select All",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Checkbox(
                    splashRadius: 20,
                    activeColor: Color(0xFFDB3022),
                    value: false,
                    onChanged: (val) {},
                  ),
                ],
              ),
              Divider(height: 20, thickness: 1, color: Colors.black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "\$300.50",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
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
                      builder: (context) => PaymentMethodScreen(),
                    ),
                  );
                },
                child: ContainerButtonModal(
                  itext: "Checkout",
                  containerwidth: MediaQuery.of(context).size.width,
                  bgColor: Color(0xFFDB3022),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
