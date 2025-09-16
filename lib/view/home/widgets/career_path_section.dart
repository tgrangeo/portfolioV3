import 'package:flutter/material.dart';
import 'package:portfoliov3/model/job.dart';
import 'package:portfoliov3/style/constant.dart';
import 'package:portfoliov3/view/common/tag.dart';

final List<Job> jobList = [
  Job(
    date: 2025,
    title: "Mobile Developper",
    workplace: "Xefi",
    description: "building some app",
    techs: ["Flutter"],
  ),
  Job(
    date: 2024,
    title: "Mobile Developper",
    workplace: "Witekio",
    description: "r&d bluettoh",
    techs: ["Angular", "Ionic"],
  ),
  Job(
    date: 2019,
    title: "Student",
    workplace: "42 Lyon",
    description:
        "Studied at the 42 Lyon developper school, learning some basics and advanced foundamentals about programming",
    techs: ["C", "C++"],
  ),
];

class CareerPathSection extends StatelessWidget {
  const CareerPathSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height * 0.9;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Center(
        child: SizedBox(
          width: screenWidth > 700 ? screenWidth * 0.4 : screenWidth * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Career Path", style: TextStyle(fontSize: 32)),
              const SizedBox(height: 64),
              Expanded(
                child: ListView.separated(
                  itemCount: jobList.length,
                  separatorBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        Divider(color: Color.fromARGB(255, 53, 53, 53)),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                  itemBuilder: (context, index) => _jobItem(jobList[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _jobItem(Job job) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 700;
      final dateWidget = Text(
        job.date.toString(),
        style: TextStyle(fontSize: isMobile ? 20 : 24, color: greyText),
      );

      final infoWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(job.title, style: TextStyle(fontSize: isMobile ? 22 : 24)),
          Text(
            job.workplace,
            style: TextStyle(fontSize: isMobile ? 16 : 18, color: greyText),
          ),
          const SizedBox(height: 12),
          Text(
            job.description,
            style: TextStyle(fontSize: isMobile ? 16 : 18, color: greyText),
            softWrap: true,
          ),
        ],
      );
      final techsWidget = Wrap(
        spacing: 8,
        runSpacing: 4,
        children: job.techs.map((tech) => Tag(tech)).toList(),
      );
      if (isMobile) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dateWidget,
              const SizedBox(height: 8),
              infoWidget,
              const SizedBox(height: 12),
              techsWidget,
            ],
          ),
        );
      }

      return SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: dateWidget),
            Expanded(flex: 6, child: infoWidget),
            Expanded(flex: 2, child: techsWidget),
          ],
        ),
      );
    },
  );
}
