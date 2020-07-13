import 'package:flutter/material.dart';
import 'package:sevencomic/ui/news/comic_news_page.dart';
import 'package:sevencomic/ui/main/comic_shelf_page.dart';
import 'package:sevencomic/ui/main/home_page.dart';

List<Widget> pages = <Widget>[HomePage(), ComicShelfPage(), ComicNewsPage()];

class MainNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainNavigator();
  }
}

class _MainNavigator extends State<MainNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          child: PageView.builder(
            itemBuilder: (context, index) => pages[index],
            itemCount: pages.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          onWillPop: () async {
            if (_lastPressed == null ||
                DateTime.now().difference(_lastPressed) >
                    Duration(seconds: 1)) {
              _lastPressed = DateTime.now();
              return false;
            }
            return true;
          }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.toys), title: Text("书架")),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_incandescent), title: Text("资讯"))
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
