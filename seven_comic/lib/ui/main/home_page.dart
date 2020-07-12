import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sevencomic/ui/rank/home_ranking_page.dart';
import 'package:sevencomic/ui/main/home_recommend_page.dart';
import 'package:sevencomic/ui/search/search_delegate.dart';
import 'package:sevencomic/ui/update/home_update_page.dart';
import 'package:sevencomic/util/status_bar_utils.dart';

List<Widget> pages = <Widget>[
  HomeUpdatePage(),
  HomeRecommendPage(),
  HomeRankingPage()
];
List<String> titles = <String>["更新", "推荐", "排行"];

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StatusBarUtils.systemUiOverlayStyle(context),
      child: DefaultTabController(
        length: pages.length,
        initialIndex: 1,
        child: Builder(builder: (context) {
          var primaryColor = Theme.of(context).primaryColor;
          if (_tabController == null) {
            _tabController = DefaultTabController.of(context);
            _tabController.addListener(() {
              _selectedIndex = _tabController.index;
            });
          }
          return Scaffold(
            body: Container(
              child: Stack(
                children: [
                  TabBarView(
                    children:
                        List.generate(pages.length, (index) => pages[index]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQueryData.fromWindow(
                                WidgetsBinding.instance.window)
                            .padding
                            .top),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: TabBar(
                              indicatorColor: Colors.transparent,
                              labelStyle: TextStyle(fontSize: 18),
                              unselectedLabelStyle: TextStyle(fontSize: 14),
                              isScrollable: true,
                              tabs: List.generate(
                                  pages.length,
                                  (index) => Tab(
                                        text: titles[index],
                                      ))),
                        ),
                        InkWell(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: DefaultSearchDelegate());
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 4, 54, 4),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius:
                                BorderRadius.all(Radius.circular(14.0))),
                            child: Text(
                              "搜索",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.toys,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
