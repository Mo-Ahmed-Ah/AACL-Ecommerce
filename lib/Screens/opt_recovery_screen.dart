import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/recovery_screen.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OptRecoveryScreen extends StatefulWidget {
  const OptRecoveryScreen({super.key});

  @override
  State<OptRecoveryScreen> createState() => _OptRecoveryScreenState();
}

class _OptRecoveryScreenState extends State<OptRecoveryScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ignore: unused_element
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEF6969),
                  ),
                ),
              ),
              SizedBox(height: 150),
              Text(
                "Please enter the OTP sent to your phone number",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 50),

              // استخدام مكتبة pin_input_text_field
              PinInputTextField(
                controller: textEditingController,
                pinLength: 4,
                decoration: BoxLooseDecoration(
                  radius: Radius.circular(8.0),
                  strokeColorBuilder: PinListenColorBuilder(
                    Colors.grey,
                    Color(0xFFDB3022),
                  ),
                  gapSpace: 10.0,
                  strokeWidth: 2.0,
                  bgColorBuilder: PinListenColorBuilder(
                    Colors.transparent,
                    Colors.transparent,
                  ),
                ),
                onSubmit: (String pin) {
                  // يمكن التحقق من OTP هنا
                  if (pin == '1234') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecoveryScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                  }
                },
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  String otp = textEditingController.text;
                  if (otp.length == 4) {
                    // تحقق من OTP قبل الانتقال
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecoveryScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter a valid OTP")),
                    );
                  }
                },
                child: Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55),
                  backgroundColor: Color(0xFFDB3022),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 