import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class Shipment extends StatefulWidget {
  const Shipment({super.key});

  @override
  State<Shipment> createState() => _ShipmentState();
}

class _ShipmentState extends State<Shipment> {
  final constantValues = Get.find<Constants>();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Shipment"),
      ),
    );
  }
}