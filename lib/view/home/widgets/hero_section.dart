import 'package:flutter/material.dart';
import 'package:portfoliov3/style/constant.dart';
import 'package:portfoliov3/view/common/tag.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: screenWidth > 700
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: screenWidth * 0.2, child: _mainRow()),
                const SizedBox(width: 32),
                SizedBox(width: screenWidth * 0.2, child: _secondRow()),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: screenWidth * 0.9, child: _mainRow()),
                const SizedBox(height: 32),
                SizedBox(width: screenWidth * 0.9, child: _secondRow()),
              ],
            ),
    );
  }
}

Column _mainRow() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("PORTFOLIO / 2025", style: TextStyle(color: greyText)),
      const SizedBox(height: 16),
      Text(
        "Thomas",
        style: TextStyle(color: whiteText, fontSize: 64, height: 1),
      ),
      Text(
        "Grangeon",
        style: TextStyle(
          color: Color.fromARGB(255, 147, 147, 147),
          fontSize: 64,
          height: 1,
        ),
      ),
      const SizedBox(height: 32),
      Text.rich(
        TextSpan(
          text:
              "Mobile Developer crafting digital experiences at the intersection of ",
          style: TextStyle(color: greyText, fontSize: 24),
          children: [
            TextSpan(
              text: "design",
              style: TextStyle(color: whiteText),
            ),
            const TextSpan(text: ", "),
            TextSpan(
              text: "technology",
              style: TextStyle(color: whiteText),
            ),
            const TextSpan(text: ", and "),
            TextSpan(
              text: "user experience",
              style: TextStyle(color: whiteText),
            ),
            const TextSpan(text: "."),
          ],
        ),
      ),
    ],
  );
}

Column _secondRow() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'CURRENTLY',
        style: TextStyle(color: greyText, fontSize: 12, letterSpacing: 1.2),
      ),
      const SizedBox(height: 12),
      Text(
        'Flutter Developer',
        style: TextStyle(
          color: whiteText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 4),
      Text('@ Xefi', style: TextStyle(color: greyText, fontSize: 16)),
      const SizedBox(height: 8),
      Text('2025 — Present', style: TextStyle(color: greyText, fontSize: 12)),
      const SizedBox(height: 28),
      Text(
        'FOCUS',
        style: TextStyle(color: greyText, fontSize: 12, letterSpacing: 1.2),
      ),
      const SizedBox(height: 12),
      const Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          Tag('Flutter'),
          Tag('Native'),
          Tag('Scripting'),
          Tag('DevX'),
        ],
      ),
    ],
  );
}
