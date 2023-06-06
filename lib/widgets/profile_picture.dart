import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';


final constantValues = Get.find<Constants>();

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.image,
    required this.radius,
    required this.onClicked,
  }) : super(key: key);
  final ImageProvider image;
  final double radius;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  Widget buildImage() {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      backgroundImage: image,
      child: InkWell(
        onTap: onClicked,
      ),
    );
  }
}