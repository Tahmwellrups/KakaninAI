import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_constants.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FancyShimmerImage(
      imageUrl: AppConstants.productImageUrl,
      width: size.width * 0.5,
      height: size.height * 0.25,
      boxFit: BoxFit.cover,

    );
  }
}