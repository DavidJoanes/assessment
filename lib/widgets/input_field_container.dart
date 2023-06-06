import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

final constantValues = Get.find<Constants>();

class TextFieldContainer extends StatelessWidget {
  final double width;
  final double radius;
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.width,
    required this.radius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: width,
      decoration: BoxDecoration(
        color: constantValues.whiteColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}