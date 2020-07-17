import 'package:flutter/material.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/provider/view_state_widget.dart';
import 'package:sevencomic/view_model/history_model.dart';

class ShelfHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShelfHistoryPage();
  }
}

class _ShelfHistoryPage extends State<ShelfHistoryPage>
    with AutomaticKeepAliveClientMixin {
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
            return Text('empty');
          }

          return Text('data');
        },
        model: HistoryModel());
  }

  @override
  bool get wantKeepAlive => true;
}
