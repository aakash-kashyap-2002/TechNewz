import 'package:flutter/material.dart';
import 'package:technews/utils/text.dart';

class BottomSheetImage extends StatelessWidget {
  final String imageurl, title;

  const BottomSheetImage({
    super.key,
    required this.imageurl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20),
              ),
              image: DecorationImage(image: NetworkImage(imageurl),fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              child: BoldText(text: title, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
