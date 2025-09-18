import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfoliov3/style/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height * 0.61;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.8,
      child: screenWidth > 700
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _content(context),
            )
          : Column(children: _content(context)),
    );
  }

  _content(context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return <Widget>[
      SizedBox(
        width: screenWidth > 700 ? screenWidth * 0.2 : screenWidth * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Connect",
              style: TextStyle(fontSize: 32, color: whiteText, height: 1.1),
            ),
            const SizedBox(height: 32),
            Text(
              "Always interested in new opportunities, collaborations, and conversations about technology and design.",
              style: TextStyle(fontSize: 24, color: greyText),
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "thomas.grangeon9@gmail.com ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: screenWidth > 700 ? screenWidth * 0.2 : screenWidth * 0.9,
        child: Column(
          children: [
            Text(
              "Anywhere else",
              style: TextStyle(fontSize: 24, color: greyText),
            ),
            SizedBox(height: 32),
            OutlinedButton(
              onPressed: () async {
                if (await canLaunchUrl(
                  Uri.parse("https://github.com/tgrangeo"),
                )) {
                  await launchUrl(
                    Uri.parse("https://github.com/tgrangeo"),
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.github),
                  SizedBox(width: 8),
                  Text("Github"),
                ],
              ),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () async {
                if (await canLaunchUrl(
                  Uri.parse(
                    "https://www.linkedin.com/in/thomas-grangeon-20a837244/",
                  ),
                )) {
                  await launchUrl(
                    Uri.parse(
                      "https://www.linkedin.com/in/thomas-grangeon-20a837244/",
                    ),
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.linkedin),
                  SizedBox(width: 8),
                  Text("LinkedIn"),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
