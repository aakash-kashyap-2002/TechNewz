import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technews/components/bottomsheet.dart';
import 'package:technews/components/divider.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';

class NewsBox extends StatelessWidget {
  const NewsBox({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.imageurl,
    required this.url,
  });
  final String title, time, description, imageurl, url;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: width,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return CircularProgressIndicator(
                      color: AppColors.primary,
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ModifiedText(
                          text: title, color: AppColors.white, size: 16),
                      const SizedBox(height: 5),
                      ModifiedText(
                          text: time, color: AppColors.lightwhite, size: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const DividerWidget(),
      ],
    );
  }
}
