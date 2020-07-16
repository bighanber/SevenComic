import 'package:flutter/material.dart';

class ShelfFavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShelfFavoritePage();
  }

}

class _ShelfFavoritePage extends State<ShelfFavoritePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ShelfFavoritePage'),
    );
  }

  @override
  bool get wantKeepAlive => true;

}