import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controller.dart';

final constantValues = Get.find<Constants>();

class ButtonA extends StatefulWidget {
  const ButtonA(
      {Key? key,
      required this.width,
      required this.radius,
      required this.text,
      required this.onpress})
      : super(key: key);
  final double width;
  final double radius;
  final String text;
  final Function onpress;

  @override
  State<ButtonA> createState() => _ButtonAState();
}

class _ButtonAState extends State<ButtonA> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: newElevatedButton(context),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.radius),
            ),
            side: BorderSide(width: 2, color: constantValues.primaryColor))),
        backgroundColor: MaterialStateProperty.all(constantValues.whiteColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 4, vertical: 2)),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(color: constantValues.primaryColor)),
      ),
      onPressed: () async {
        await widget.onpress();
      },
    );
  }
}

class ButtonB extends StatefulWidget {
  const ButtonB(
      {Key? key,
      required this.width,
      required this.radius,
      required this.icon,
      required this.color,
      required this.text,
      required this.onpress})
      : super(key: key);
  final double width;
  final double radius;
  final Widget icon;
  final Color color;
  final String text;
  final Function onpress;

  @override
  State<ButtonB> createState() => _ButtonBState();
}

class _ButtonBState extends State<ButtonB> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: newElevatedButton(context),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.radius),
            ),
            side: BorderSide(width: 2, color: constantValues.whiteColor))),
        backgroundColor: MaterialStateProperty.all(constantValues.whiteColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 4, vertical: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon,
          const SizedBox(width: 5),
          Text(
            widget.text,
            style:
                GoogleFonts.poppins(textStyle: TextStyle(color: widget.color)),
          ),
        ],
      ),
      onPressed: () async {
        await widget.onpress();
      },
    );
  }
}
