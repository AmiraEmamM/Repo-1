import 'package:green_pulse/core/config/resource/app_assets.dart';

class HomeProductModel {
  final String image;
  final String title;
  final String description;

  HomeProductModel({
    required this.image,
    required this.title,
    required this.description,
  });

}

List<HomeProductModel> homeProducts = [
  HomeProductModel(
    image: AppImages.flfl,
    title: 'Pepper',
    description: '(Need nutriens)',
  ),
  HomeProductModel(
    image: AppImages.gargeer,
    title: 'Arugula',
    description: '(Need nutriens)',
  ),

  HomeProductModel(
    image: AppImages.flfl,
    title: 'Pepper',
    description: '(Need nutriens)',
  ),
  HomeProductModel(
    image: AppImages.gargeer,
    title: 'Arugula',
    description: '(Need nutriens)',
  ),
  // Add more products as needed
];

