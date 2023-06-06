import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';
import 'calculate.dart';
import 'home.dart';
import 'profile.dart';
import 'shipment.dart';

class HomeFrame extends StatefulWidget {
  const HomeFrame({super.key});

  @override
  State<HomeFrame> createState() => _HomeFrameState();
}

class _HomeFrameState extends State<HomeFrame> {
  final constantValues = Get.find<Constants>();
  late int currentIndex = 0;
  final tabs = [
    const Center(child: Home()),
    const Center(child: Calculate()),
    const Center(child: Shipment()),
    const Center(child: Profile()),
  ];
  
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
    return Scaffold(
      bottomNavigationBar: FancyBottomBar(
        selectedIndex: currentIndex,
        type: FancyType.FancyV1,
        items: [
          FancyItem(
            textColor: constantValues.primaryColor,
            title: 'Home',
            icon: const Icon(Icons.home_outlined),
          ),
          FancyItem(
            textColor: constantValues.navBarItemColor,
            title: 'Calculate',
            icon: const Icon(Icons.calculate_outlined),
          ),
          FancyItem(
            textColor: constantValues.navBarItemColor,
            title: 'Shipment',
            icon: const Icon(Icons.refresh_outlined),
          ),
          FancyItem(
            textColor: constantValues.navBarItemColor,
            title: 'Profile',
            icon: const Icon(Icons.person_2_outlined),
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
            constantValues.navBarItemColor = constantValues.primaryColor;
          });
        },
      ),
      body: tabs[currentIndex]
    );
  }
}
