import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/widget/image_colors.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final double bannerHeight;
  final BoxFit fit;

  BannerImage(this.url, this.bannerHeight, {this.fit: BoxFit.fill});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ImageColors(
        image: NetworkImage(url, headers: {"Referer": "http://v3api.dmzj.com/"}),
        imageSize: Size(MediaQuery.of(context).size.width, bannerHeight),
      ),
    );
  }
}
