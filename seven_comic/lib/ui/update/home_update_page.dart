import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sevencomic/entity/index_update_entity.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/ui/update/update_list_item.dart';
import 'package:sevencomic/view_model/comic_update_model.dart';

class HomeUpdatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeUpdatePage();
  }
}

class _HomeUpdatePage extends State<HomeUpdatePage> with AutomaticKeepAliveClientMixin  {
  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 2 * 15 - 10 * 2) / 3.0;
    final itemHeight = itemWidth * 1.46 + 35.0;
    return ProviderWidget<ComicUpdateModel>(
        model: ComicUpdateModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return Text("loading");
          }

          return Scaffold(
            appBar: AppBar(),
            body: SmartRefresher(
                controller: model.refreshController,
              onRefresh: model.refresh,
              onLoading: model.loadMore,
              enablePullUp: true,
              child: GridView.builder(
                shrinkWrap: true,
                  itemCount: model.list.length,
//                  physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: itemWidth,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: itemWidth / itemHeight
                  ), 
                  itemBuilder: (context, index) {
                  IndexUpdateEntity entity = model.list[index];
                  return UpdateItemWidget(entity);
                  },
              ),
            ),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
