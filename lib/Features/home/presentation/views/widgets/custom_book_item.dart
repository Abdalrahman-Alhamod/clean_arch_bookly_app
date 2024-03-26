import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly/core/utils/custom_fading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          placeholder: (context, url) {
            return const CustomFadingWidget(
              child: CustomBookImageLoadingIndicator(),
            );
          },
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
