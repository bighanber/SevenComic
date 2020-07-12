import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewStateLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}

class ViewStateEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Empty"),
    );
  }

}

class ViewStateErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Error"),
    );
  }

}