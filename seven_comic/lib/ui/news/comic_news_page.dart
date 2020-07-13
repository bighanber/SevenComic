import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sevencomic/entity/comic_news_entity.dart';
import 'package:sevencomic/entity/comic_news_header_entity.dart';
import 'package:sevencomic/manager/provider_manager.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/provider/view_state_widget.dart';
import 'package:sevencomic/view_model/news_model.dart';

class ComicNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComicNewsPage();
  }
}

class _ComicNewsPage extends State<ComicNewsPage> with AutomaticKeepAliveClientMixin  {
  var bannerHeight;
  @override
  Widget build(BuildContext context) {
    bannerHeight = MediaQuery.of(context).size.width * 0.5;
    return ProviderWidget2<NewsHeaderModel, NewsModel>(
      model1: NewsHeaderModel(),
      model2: NewsModel(),
      onModelReady: (headModel, newsModel) {
        headModel.initData();
        newsModel.initData();
      },
      builder: (context, headModel, newsModel, child) {
        return Scaffold(
          body: SmartRefresher(
            controller: newsModel.refreshController,
            enablePullUp: true,
            onRefresh: newsModel.refresh,
            onLoading: newsModel.loadMore,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  brightness: Theme.of(context).brightness == Brightness.light &&
                      newsModel.isBusy
                      ? Brightness.light
                      : Brightness.dark,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      height: bannerHeight,
                      child: NewsBannerWidget(bannerHeight),
                    ),
                    centerTitle: true,
                  ),
                  expandedHeight: bannerHeight,
                  pinned: true,
                ),
                if (newsModel.isEmpty)
                  SliverToBoxAdapter(
                    child: Text("empty"),
                  ),
                NewsListWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class NewsBannerWidget extends StatelessWidget {

  var bannerHeight;

  NewsBannerWidget(this.bannerHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Consumer<NewsHeaderModel>(
          builder: (context, model, child) {
            if (model.isBusy) {
              return CupertinoActivityIndicator();
            } else {
              var banners = model?.list ?? [];
              return Swiper(
                loop: true,
                autoplay: true,
                autoplayDelay: 5000,
                pagination: SwiperPagination(),
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  ComicNewsHeaderData data = banners[index];
                  return InkWell(
                    onTap: () {
                      var banner = banners[index];
                    },
                    child: Image(
                      fit: BoxFit.fill,
                        image: NetworkImage(data.picUrl,
                        headers: {"Referer": "http://v3api.dmzj.com/"})),
                  );
                },
              );
            }
          }
      ),
    );
  }

}

class NewsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsModel model = Provider.of(context);
    if (model.isBusy) {
      return ViewStateLoadingWidget();
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        ComicNewsEntity entity = model.list[index];
        return NewsItemWidget(entity);
      },
      childCount: model.list.length,
      ),
    );
  }

}

class NewsItemWidget extends StatelessWidget {

  ComicNewsEntity data;
  int index;

  NewsItemWidget(this.data, {this.index})
      : super(key: ValueKey(data.authorId));

  @override
  Widget build(BuildContext context) {
    return Text(data.title);
  }

}
