import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/view_model/recommend_model.dart';
import 'package:sevencomic/widget/banner_image.dart';

class HomeRecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeRecommendPage();
  }
}

class _HomeRecommendPage extends State<HomeRecommendPage> with AutomaticKeepAliveClientMixin {

  var bannerHeight;

  @override
  Widget build(BuildContext context) {
    bannerHeight = MediaQuery
        .of(context)
        .size
        .width * 4 / 7;

    return ProviderWidget<RecommendModel>(
      onModelReady: (recommendModel) {
        recommendModel.initData();
      },
      builder: (context, recommendModel, child) {
        return Scaffold(
          body: Container(
            height: bannerHeight,
            child: BannerWidget(bannerHeight),
          ),
        );
      },
      model: RecommendModel(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BannerWidget extends StatelessWidget {

  var bannerHeight;

  BannerWidget(this.bannerHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      child: Consumer<RecommendModel>(
          builder: (context, recommendModel, child) {
            if (recommendModel.isBusy) {
              return CupertinoActivityIndicator();
            } else {
              var banners = recommendModel?.banners ?? [];
              return Swiper(
                loop: true,
                autoplay: true,
                autoplayDelay: 5000,
                pagination: SwiperPagination(),
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var banner = banners[index];
                    },
                    child: BannerImage(banners[index].cover, bannerHeight, fit: BoxFit.fill,),
                  );
                },
              );
            }
          }),
    );
  }

}
