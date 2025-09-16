import 'package:flutter/material.dart';
import 'package:portfoliov3/style/constant.dart';
import 'package:portfoliov3/view/home/widgets/career_path_section.dart';
import 'package:portfoliov3/view/home/widgets/contact_section.dart';
import 'package:portfoliov3/view/home/widgets/device_section.dart';
import 'package:portfoliov3/view/home/widgets/hero_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _careerKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _deviceKey = GlobalKey();

  int _currentSection = 0;
  late final List<_SectionItem> _sections;

  @override
  void initState() {
    super.initState();
    _sections = [
      _SectionItem(key: _heroKey, index: 0),
      _SectionItem(key: _careerKey, index: 1),
      _SectionItem(key: _deviceKey, index: 2),
      _SectionItem(key: _contactKey, index: 3),
    ];
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    for (var section in _sections) {
      final context = section.key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        if (position.dy >= 0 &&
            position.dy < MediaQuery.of(context).size.height / 2) {
          if (_currentSection != section.index) {
            setState(() {
              _currentSection = section.index;
            });
          }
          break;
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final context = _sections[index].key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlack,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(key: _heroKey, child: const HomeHeroSection()),
                Container(key: _careerKey, child: const CareerPathSection()),
                Container(key: _deviceKey, child: const DeviceSection()),
                Container(key: _contactKey, child: const ContactSection()),
                _footer(context),
              ],
            ),
          ),

          if (MediaQuery.sizeOf(context).width > 700) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _buildVerticalIndicator(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVerticalIndicator() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_sections.length, (index) {
        final isActive = index == _currentSection;
        return GestureDetector(
          onTap: () => _scrollToSection(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 8,
            height: 32,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.grey.shade700,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        );
      }),
    );
  }
}

class _SectionItem {
  final GlobalKey key;
  final int index;

  _SectionItem({required this.key, required this.index});
}

Widget _footer(BuildContext context) {
  return Center(
    child: SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          SizedBox(height: 16),
          Text(
            "© 2025 Thomas grangeon. All right reserved.",
            style: TextStyle(color: greyText),
          ),
          SizedBox(height: 4),
          Text("built with Flutter", style: TextStyle(color: greyText)),
          SizedBox(height: 32),
        ],
      ),
    ),
  );
}
