import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/provider/view_state_widget.dart';
import 'package:sevencomic/ui/shelf/history_list_item.dart';
import 'package:sevencomic/view_model/history_model.dart';

class ShelfHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShelfHistoryPage();
  }
}

class _ShelfHistoryPage extends State<ShelfHistoryPage>
    with AutomaticKeepAliveClientMixin {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HistoryModel>(
        onModelReady: (model) {
          model.initData();
        },
        builder: (context, model, child) {
          if (model.isBusy) {
            return ViewStateLoadingWidget();
          }

          if (model.isEmpty || model.historyList.isEmpty) {
            return Center(
              child: Text("empty"),
            );
          }

          return SmartRefresher(
              controller: model.refreshController,
            onRefresh: model.refresh,
            child: ListView.builder(
              itemCount: model.historyList.length,
                itemBuilder: (context, index) {
                  return HistoryItemWidget(model.historyList[index]);
                }
            ),
          );
        },
        model: HistoryModel(model: Provider.of(context, listen: false)));
  }

  @override
  bool get wantKeepAlive => true;
}
