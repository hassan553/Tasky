import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tt/core/services/network_service/endpoints.dart';
import 'package:tt/core/utils/app_colors.dart';

class CustomImageHandler extends StatelessWidget {
  const CustomImageHandler(
    this.path, {
    super.key,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
  });
  final dynamic path;
  final BoxFit fit;
  final double? height, width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (path is File) {
      return Image.file(
        path,
        fit: fit,
        color: color,
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Icon(Icons.error));
        },
      );
    }
    if (path is Uint8List) {
      return Image.memory(
        path,
        fit: fit,
        color: color,
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Icon(Icons.error));
        },
      );
    }

    if (path.startsWith('http') ||
        path.startsWith('https') ||
        path.startsWith('www.')) {
      return CachedNetworkImage(
        imageUrl: '${EndPoints.imagesPath}$path',
        fit: fit,
        width: width,
        height: height,
        errorWidget: (BuildContext context, _, stackTrace) {
          return const Center(
            child: Icon(Icons.error),
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                value: downloadProgress.progress,
              ),
            ),
          );
        },
      );
    }
    if (path.endsWith('.svg')) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          path,
          fit: fit,
          height: height,
          width: width,
          colorFilter: color == null
              ? null
              : ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                ),
        ),
      );
    }
    return Image.asset(
      path,
      fit: fit,
      color: color,
      height: height,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(Icons.error),
        );
      },
    );
  }
}
