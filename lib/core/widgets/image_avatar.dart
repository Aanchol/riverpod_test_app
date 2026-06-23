import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class ImageAvatar extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback? onTap;
  final ImageProvider fallbackImage;

  /// Circle or Rectangle
  final BoxShape shape;

  /// Used only when shape == BoxShape.rectangle
  final BorderRadius? borderRadius;

  final BoxFit fit;

  const ImageAvatar({
    super.key,
    this.imageUrl,
    this.width = 80,
    this.height = 80,
    this.borderWidth = 2,
    this.borderColor = AppColors.black,
    this.onTap,
    required this.fallbackImage,
    this.shape = BoxShape.circle,
    this.borderRadius,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final imageProvider = imageUrl != null && imageUrl!.isNotEmpty
        ? NetworkImage(imageUrl!)
        : fallbackImage;

    Widget image = Image(
      image: imageProvider,
      width: width,
      height: height,
      fit: fit,
    );

    if (shape == BoxShape.circle) {
      image = ClipOval(child: image);
    } else {
      image = ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: image,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          shape: shape,
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
        ),
        child: image,
      ),
    );
  }
}
