import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final bool userPlaceholder;
  final double height;
  final double width;

  ImageView(
    this.url, {
    this.fit,
    this.height = 60,
    this.width = 60,
    this.userPlaceholder = true,
  });

  Widget placeholder(BuildContext context, {bool error = false}) {
    if (!userPlaceholder && error) {
      return SizedBox(height: height, width: width);
    }

    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: Center(
        child: Icon(
          Icons.cloud_off,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return placeholder(context);
    }

    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: BoxFit.fill,
        height: height,
        width: width,
      ),
      errorWidget: (context, url, error) =>
          placeholder(context, error: error != null),
      placeholder: (context, url) => Container(
        color: Colors.grey.withOpacity(0.4),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
