import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technews/components/bottomimage.dart';
import 'package:technews/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    )),
    elevation: 20,
    builder: (context) {
      // returns your BottomSheet widget
      return MyBottomSheetLayout(
        title: title,
        description: description,
        imageurl: imageurl,
        url: url,
      );
    },
  );
}

// _launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

_launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

//your bottom sheet widget class
//you can put your things here, like buttons, callbacks and layout
class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout({
    super.key,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
              text: description,
              color: Colors.white,
              size: 16,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Read Full Article',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL(url);
                      },
                    style: GoogleFonts.lato(color: Colors.blue.shade400,),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
