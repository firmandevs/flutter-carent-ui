import 'package:carent/domain/car/image.dart';

class Car {
  List<CarImage> imageList;
  String preview;
  String title;

  Car({
    required this.imageList,
    required this.preview,
    required this.title,
  });
}
