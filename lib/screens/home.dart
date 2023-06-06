import 'package:assessment/widgets/input_fields.dart';
import 'package:assessment/widgets/profile_picture.dart';
import 'package:assessment/widgets/vehicles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controller.dart';
import '../controllers/vehicles_data.dart';
import '../widgets/buttons.dart';

final globalBucket = PageStorageBucket();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final constantValues = Get.find<Constants>();
  final _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    VehiclesData object = VehiclesData();
    var fontStyle1 = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w700));
    var fontStyle1b = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: constantValues.primaryColor));
    var fontStyle1c = GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700));
    var fontStyle1d = GoogleFonts.poppins(textStyle: const TextStyle());
    var fontStyle2 = GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700));
    var fontStyle2b = GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700));
    var fontStyle2c = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: constantValues.greyColor));
    return PageStorage(
      bucket: globalBucket,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(size.width * 0.015),
            child: ProfilePicture(
                radius: 10,
                image: const AssetImage("assets/images/dp.jpg"),
                onClicked: () {}),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverflowBar(
                children: [
                  const Icon(Icons.send_outlined, size: 14),
                  Text(" Your location", style: fontStyle1c),
                ],
              ),
              OverflowBar(
                children: [
                  Text(
                    "Garki, Abuja",
                    style: fontStyle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_drop_down_outlined,
                      ))
                ],
              ),
            ],
          ),
          actions: [
            CircleAvatar(
              backgroundColor: constantValues.whiteColor,
              radius: 20,
              child: const Icon(Icons.notifications_none_outlined),
            ),
            SizedBox(width: size.width * 0.05)
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.11,
                  width: size.width,
                  color: constantValues.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.01),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputFieldA(
                            fontStyle: fontStyle1d,
                            controller: searchController,
                            width: size.width * 0.9,
                            radius: size.width * 0.2,
                            title: "Enter the receipt number..",
                            enabled: true,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: CircleAvatar(
                                backgroundColor: constantValues.orangeColor,
                                radius: 14,
                                child: Icon(
                                  Icons.print_outlined,
                                  color: constantValues.whiteColor,
                                )),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Column(
                    children: [
                      ListTile(leading: Text("Tracking", style: fontStyle1b)),
                      SizedBox(height: size.height * 0.01),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Card(
                          elevation: 0,
                          child: SizedBox(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Shipment Number",
                                      style: fontStyle2c),
                                  subtitle: Text("NEJ20089934122231",
                                      style: fontStyle2),
                                  trailing: ProfilePicture(
                                      radius: size.width * 0.05,
                                      image: const AssetImage(
                                          "assets/images/tractor.jpg"),
                                      onClicked: () {}),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: ListTile(
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    constantValues.pinkColor2,
                                                radius: 14,
                                                backgroundImage: const AssetImage(
                                                    "assets/icons/present.png")),
                                            title: Text("Sender",
                                                style: fontStyle2c),
                                            subtitle: Text("Abuja, 900101",
                                                style: fontStyle2b),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.4,
                                          child: ListTile(
                                            title: Text("Time",
                                                style: fontStyle2c),
                                            subtitle: Row(
                                              children: [
                                                Icon(Icons.circle,
                                                    size: 10,
                                                    color: constantValues
                                                        .greenColor2),
                                                Text(
                                                  " 2-3 days",
                                                  style: fontStyle2b,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.5,
                                          child: ListTile(
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    constantValues.greenColor2,
                                                radius: 14,
                                                backgroundImage: const AssetImage(
                                                    "assets/icons/present.png")),
                                            title: Text("Receiver",
                                                style: fontStyle2c),
                                            subtitle: Text("Rivers, 500102",
                                                style: fontStyle2b),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.4,
                                          child: ListTile(
                                            title: Text("Status",
                                                style: fontStyle2c),
                                            subtitle: Text(
                                              "Waiting to collect",
                                              style: fontStyle2b,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.01),
                                ButtonB(
                                  width: size.width * 0.3,
                                  radius: size.width * 0.01,
                                  icon:
                                      const Icon(Icons.add, color: Colors.red),
                                  color: Colors.red,
                                  text: "Add Stop",
                                  onpress: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      ListTile(
                          leading:
                              Text("Available Vehicles", style: fontStyle1b)),
                      SizedBox(height: size.height * 0.001),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Vehicles(object: object.data),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
