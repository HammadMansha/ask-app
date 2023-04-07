import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets/app_assets.dart';

class CircularCachedNetworkImage extends StatelessWidget {
  final String imageURL;
  final double height;
  final double width;
  final Color borderColor;
  final BoxFit fit;
  final double borderWidth;
  final BoxShape shape;
  final String errorImage;
  final double radius;

   CircularCachedNetworkImage({
    required this.imageURL,
    required this.width,
    required this.height,
    required this.borderColor,
    this.fit = BoxFit.cover,
    this.borderWidth = 2,
    this.shape = BoxShape.circle,
    this.errorImage = AppAssets.avatar,
    this.radius = 300
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: borderColor,
        shape: shape,
      ),
      child: Padding(
        padding: EdgeInsets.all(borderWidth),
        child: Container(
          decoration: BoxDecoration(
            shape: shape,
            color: Colors.white, // inner circle color
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            child: CachedNetworkImage(
              imageUrl: imageURL,
              fit: fit,
              placeholder: (context, url) => Image.network(
                errorImage,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.network(
                errorImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
