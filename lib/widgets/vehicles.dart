// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controller.dart';

final globalBucket = PageStorageBucket();

class Vehicles extends StatefulWidget {
  Vehicles({super.key, required this.object});
  var object;

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
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
    Size size = MediaQuery.of(context).size;
    final fontstyle1 = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w600));
    final fontstyle1b = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w400));
    return PageStorage(
        bucket: globalBucket,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.001, vertical: size.height * 0.01),
            child: SizedBox(
              height: size.height * 0.25,
              width: double.infinity,
              child: ListView.builder(
                  key: const PageStorageKey<String>("vehicles"),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.object.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        height: size.height * 0.2,
                        width: size.width * 0.35,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(widget.object[index].title,
                                  style: fontstyle1),
                              subtitle: Text(widget.object[index].subTitle,
                                  style: fontstyle1b),
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size.width * 0.01)),
                                child: SizedBox(
                                    height: size.height * 0.1,
                                    child: Image.asset(
                                        widget.object[index].image))),
                          ],
                        ),
                      ),
                    );
                  }).animate().slideX(curve: Curves.linear),
            )));
  }
}
