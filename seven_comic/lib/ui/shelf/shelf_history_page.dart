import 'package:flutter/material.dart';

class ShelfHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShelfHistoryPage();
  }

}

class _ShelfHistoryPage extends State<ShelfHistoryPage> with AutomaticKeepAliveClientMixin {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('history'),
    );
  }

  @override
  bool get wantKeepAlive => true;

}