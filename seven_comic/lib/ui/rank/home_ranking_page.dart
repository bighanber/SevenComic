import 'package:flutter/material.dart';
import 'package:sevencomic/ui/rank/comic_rank_page.dart';

List<Widget> pages = <Widget>[
  ComicRankPage(0),
  ComicRankPage(1),
  ComicRankPage(2),
];
List<String> titles = <String>["人气", "吐槽", "订阅"];

class HomeRankingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeRankingPage();
  }
}

class _HomeRankingPage extends State<HomeRankingPage> {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: pages.length,
        initialIndex: 0,
        child: Builder(builder: (context) {
          if (_tabController == null) {
            _tabController = DefaultTabController.of(context);
            _tabController.addListener(() {});
          }
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  indicatorColor: Color(0xff333333),
                  indicatorPadding: EdgeInsets.fromLTRB(15, 0, 15, 6),
                  labelStyle: TextStyle(fontSize: 12),
                  labelColor: Color(0xff333333),
                  unselectedLabelColor: Color(0xffcccccc),
                  isScrollable: true,
                  tabs: List.generate(
                    pages.length,
                        (index) => Tab(
                      text: titles[index],
                    ),
                  ),
                ),

                Expanded(child: TabBarView(
                  children: List.generate(pages.length, (index) => pages[index]),
                ),),
              ],
            ),
          );
        }),
      ),
    );
  }
}
