import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/widget/image_colors.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  BannerImage(this.url, {this.fit: BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageColors(
        title: 'title',
          image: NetworkImage(url, headers: {"Referer": "http://v3api.dmzj.com/"}),
        imageSize: Size(256.0, 170.0),
      ),
    );
  }
}
