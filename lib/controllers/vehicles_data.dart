import 'package:assessment/controllers/controller.dart';
import 'package:get/get.dart';

final constantValues = Get.find<Constants>();

class VehiclesPackage {
  String title;
  String subTitle;
  String image;

  VehiclesPackage(this.title, this.subTitle, this.image);
}

class VehiclesData {
  List<VehiclesPackage> data = [
    VehiclesPackage("Ocean freight", "International", "assets/images/ship.jpg"),
    VehiclesPackage("Cargo freight", "Reliable", "assets/images/truck.jpg"),
    VehiclesPackage("Air freight", "International", "assets/images/aeroplane.jpg"),
  ];
}