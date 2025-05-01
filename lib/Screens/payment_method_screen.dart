import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/shipping_address_screen.dart';
import 'package:flutter_ecommerce/Widgets/container_button_modal.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _type = 1;

  void _handleRadio(Object? e) => setState(() {
    _type = e as int;
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 40),
                _buildPaymentOption(
                  value: 1,
                  label: "Amazon Pay",
                  imagePath: "assets/images/amazon-pay.png",
                  imageWidth: 75,
                  imageHeight: 75,
                ),
                SizedBox(height: 15),
                _buildPaymentOption(
                  value: 2,
                  label: "Credit Card",
                  imagePath: null,
                  trailingWidgets: [
                    Image.asset("assets/images/visa.png", width: 40),
                    SizedBox(width: 8),
                    Image.asset("assets/images/mastercard.png", width: 40),
                  ],
                ),
                SizedBox(height: 15),
                _buildPaymentOption(
                  value: 3,
                  label: "PayPal",
                  imagePath: "assets/images/paypal.png",
                  imageWidth: 70,
                  imageHeight: 70,
                ),
                SizedBox(height: 15),
                _buildPaymentOption(
                  value: 4,
                  label: "Google Pay",
                  imagePath: "assets/images/icon2.png",
                  imageWidth: 70,
                  imageHeight: 70,
                ),
                SizedBox(height: 100),
                _buildSummaryRow("Sub-Total", "\$200.00"),
                SizedBox(height: 15),
                _buildSummaryRow("Shipping fee", "\$15.0"),
                Divider(height: 30, color: Colors.black),
                _buildSummaryRow("Total Payment", "\$215.0", isTotal: true),
                SizedBox(height: 70),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShippingAddressScreen(),
                      ),
                    );
                  },
                  child: ContainerButtonModal(
                    itext: "Confirm Payment",
                    containerwidth: size.width,
                    bgColor: Color(0xFFDB3022),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required int value,
    required String label,
    String? imagePath,
    double imageWidth = 0,
    double imageHeight = 0,
    List<Widget>? trailingWidgets,
  }) {
    bool isSelected = _type == value;

    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? 1 : 0.3,
          color: isSelected ? Color(0xFFDB3022) : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: _type,
              onChanged: _handleRadio,
              activeColor: Color(0xFFDB3022),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Spacer(),
            if (trailingWidgets != null)
              ...trailingWidgets
            else if (imagePath != null)
              Image.asset(imagePath, width: imageWidth, height: imageHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isTotal ? FontWeight.w400 : FontWeight.w400,
            color: isTotal ? Colors.black : Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: isTotal ? Color(0xFFDB3022) : Colors.black,
          ),
        ),
      ],
    );
  }
}
