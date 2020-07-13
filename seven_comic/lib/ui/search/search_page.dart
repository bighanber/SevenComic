import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/provider/view_state_widget.dart';
import 'package:sevencomic/ui/search/search_list_item.dart';
import 'package:sevencomic/view_model/search_model.dart';

class SearchPage extends StatelessWidget {

  String keyword;
  SearchHistoryModel searchHistoryModel;

  SearchPage({this.keyword, this.searchHistoryModel});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SearchResultModel>(
        model: SearchResultModel(
            keyword: keyword, searchHistoryModel: searchHistoryModel),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return ViewStateLoadingWidget();
          } else if (model.isError) {
            return ViewStateErrorWidget();
          } else if (model.isEmpty) {
            return ViewStateEmptyWidget();
          }

          return SmartRefresher(
            controller: model.refreshController,
            onLoading: model.loadMore,
            child: ListView.builder(
                itemCount: model.list.length,
                itemBuilder: (context, index) {
                  return SearchItemWidget(model.list[index]);
                }
            ),
          );
        }
    );
  }

}