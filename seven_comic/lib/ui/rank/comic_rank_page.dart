import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/ui/rank/rank_list_item.dart';
import 'package:sevencomic/view_model/comic_rank_model.dart';

class ComicRankPage extends StatefulWidget {
  int type;

  ComicRankPage(this.type);

  @override
  State<StatefulWidget> createState() {
    return _ComicRankPage();
  }
}

class _ComicRankPage extends State<ComicRankPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ComicRankModel>(
      model: ComicRankModel(widget.type),
      onModelReady: (model) => model.initData(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return Text("loading");
        }

        return SmartRefresher(
            controller: model.refreshController,
          onRefresh: model.refresh,
          onLoading: model.loadMore,
          enablePullUp: true,
          child: ListView.builder(
            itemCount: model.list.length,
              itemBuilder: (context, index) {
                return RankItemWidget(model.list[index]);
              }
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
