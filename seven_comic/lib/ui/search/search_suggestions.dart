import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sevencomic/entity/hot_search_entity.dart';
import 'package:sevencomic/provider/view_state_list_model.dart';
import 'package:sevencomic/view_model/search_model.dart';

class SearchSuggestions<T> extends StatelessWidget {
  SearchDelegate delegate;

  SearchSuggestions({@required this.delegate});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: MultiProvider(
              providers: [
                Provider<TextStyle>.value(
                    value: Theme.of(context).textTheme.bodyText2),
                ProxyProvider<TextStyle, Color>(
                  update: (context, textStyle, _) =>
                      textStyle.color.withOpacity(0.5),
                ),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchHistoryWidget(
                    delegate: delegate,
                  ),
                  SearchHotWidget(
                    delegate: delegate,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class SearchHistoryWidget<T> extends StatefulWidget {
  SearchDelegate<T> delegate;

  SearchHistoryWidget({@required this.delegate, key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchHistoryWidgetState();
  }
}

class _SearchHistoryWidgetState extends State<SearchHistoryWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchHistoryModel>(context, listen: false).initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "搜索历史",
                style: TextStyle(fontSize: 12, color: Color(0xff666666)),
              ),
              Consumer<SearchHistoryModel>(
                builder: (context, model, child) => IconButton(
                    iconSize: 16,
                    color: Color(0xff666666),
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      model.clearHistory();
                    }),
              ),
            ],
          ),
        ),
        SearchSuggestionStateWidget<SearchHistoryModel, String>(
          builder: (context, item) => ActionChip(
              label: Text(item),
              onPressed: () {
                widget.delegate.query = item;
                widget.delegate.showResults(context);
              }),
        ),
      ],
    );
  }
}

class SearchHotWidget extends StatefulWidget {
  SearchDelegate delegate;

  SearchHotWidget({@required this.delegate, key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchHotWidgetState();
  }
}

class _SearchHotWidgetState extends State<SearchHotWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchHotModel>(context, listen: false).initData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "热门搜索",
            style: TextStyle(fontSize: 12, color: Color(0xff666666)),
          ),
        ),
        SearchSuggestionStateWidget<SearchHotModel, HotSearchEntity>(
          builder: (context, item) => ActionChip(
              label: Text(item.name, style: TextStyle(fontSize: 12, color: Color(0xff333333)),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.all(0),
              onPressed: () {
                widget.delegate.query = item.name;
                widget.delegate.showResults(context);
              }),
        ),
      ],
    );
  }
}

class SearchSuggestionStateWidget<T extends ViewStateListModel, E>
    extends StatelessWidget {
  final Widget Function(BuildContext context, E data) builder;

  SearchSuggestionStateWidget({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, model, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: model.isIdle
            ? Wrap(
                alignment: WrapAlignment.start,
                spacing: 6,
                runSpacing: 0,
                children: List.generate(model.list.take(20).length, (index) {
                  E item = model.list[index];
                  return builder(context, item);
                }),
              )
            : Container(
                alignment: Alignment.center,
                child: Builder(
                  builder: (context) {
                    if (model.isBusy) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: CupertinoActivityIndicator(),
                      );
                    } else if (model.isError) {
                      return Text("error");
                    } else if (model.isEmpty) {
                      return Text("empty");
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
      ),
    );
  }
}
