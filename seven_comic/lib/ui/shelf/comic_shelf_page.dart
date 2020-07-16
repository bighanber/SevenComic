import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/ui/shelf/shelf_favorite_page.dart';
import 'package:sevencomic/ui/shelf/shelf_history_page.dart';

List<Widget> pages = <Widget>[ShelfHistoryPage(), ShelfFavoritePage()];
List<String> titles = <String>["历史", "收藏"];

class ComicShelfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComicShelfPage();
  }
}

class _ComicShelfPage extends State<ComicShelfPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            title: Stack(
              children: [
                TabBar(
                  isScrollable: true,
                  labelColor: Color(0xff333333),
                  indicatorColor: Color(0xff333333),
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  unselectedLabelColor: Color(0xffcccccc),
                  unselectedLabelStyle: TextStyle(),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  indicatorPadding: EdgeInsets.fromLTRB(20, 0, 20, 6),
                  tabs: List.generate(
                    pages.length,
                    (index) => Tab(
                      text: titles[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: List.generate(pages.length, (index) => pages[index]),
          ),
        );
      }),
    );
  }
}
