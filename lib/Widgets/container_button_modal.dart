import 'package:flutter/material.dart';

class ContainerButtonModal extends StatelessWidget {
  final Color? bgColor;
  final double? containerwidth;
  final String itext;

  const ContainerButtonModal({
    super.key,
    this.bgColor,
    this.containerwidth,
    required this.itext,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerwidth,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          itext,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
