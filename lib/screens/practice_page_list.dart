import 'package:flutter/material.dart';
import 'package:junkim_velog/constants/sizes.dart';
import 'package:junkim_velog/widgets/practice_page_item.dart';

class PracticePage {
  String label;
  Widget targetScreen;

  PracticePage({
    required this.label,
    required this.targetScreen,
  });
}

class PracticePageListScreen extends StatefulWidget {
  const PracticePageListScreen({super.key});

  @override
  State<PracticePageListScreen> createState() => _PracticePageListScreenState();
}

class _PracticePageListScreenState extends State<PracticePageListScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<PracticePage> pages = [
    PracticePage(label: '주소검색 API', targetScreen: Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          controller: _scrollController,
          scrollBehavior: NoBehavior(),
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              elevation: 1,
              title: Text(
                "JunKim Velog Examples",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < pages.length; i++)
                        PracticePageItem(
                          label: pages[i].label,
                          targetScreen: Container(),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
