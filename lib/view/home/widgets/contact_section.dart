import 'package:flutter/material.dart';
import 'package:portfoliov3/style/constant.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height * 0.61;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.2,
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
            width: screenWidth * 0.2,
            child: Column(children: [Text("annywhere else")]),
          ),
        ],
      ),
    );
  }
}
