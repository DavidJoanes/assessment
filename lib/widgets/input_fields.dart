import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller.dart';
import 'input_field_container.dart';

final constantValues = Get.find<Constants>();


class InputFieldA extends StatefulWidget {
  final TextEditingController controller;
  final double width;
  final double radius;
  final String title;
  final bool enabled;
  final Widget prefixIcon;
  final Widget suffixIcon;
  InputFieldA({
    Key? key,
    required this.controller,
    required this.width,
    required this.radius,
    required this.title,
    required this.enabled,
    required this.prefixIcon,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  State<InputFieldA> createState() => _InputFieldAState();
}

class _InputFieldAState extends State<InputFieldA> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      radius: widget.radius,
      child: TextFormField(
        textInputAction: TextInputAction.send,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        autofillHints: const [AutofillHints.name],
        enabled: widget.enabled,
        validator: (value) => value == '' ? "required!" : null,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle()),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          labelText: widget.title,
          labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: constantValues.greyColor)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
