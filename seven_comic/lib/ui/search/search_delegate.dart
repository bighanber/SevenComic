import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sevencomic/ui/search/search_page.dart';
import 'package:sevencomic/ui/search/search_suggestions.dart';
import 'package:sevencomic/view_model/search_model.dart';

class DefaultSearchDelegate extends SearchDelegate {
  SearchHistoryModel _searchHistoryModel = SearchHistoryModel();
  SearchHotModel _searchHotModel = SearchHotModel();

  @override
  ThemeData appBarTheme(BuildContext context) {
    var theme = Theme.of(context);
    return super.appBarTheme(context).copyWith(
          primaryColor: theme.scaffoldBackgroundColor,
          primaryColorBrightness: theme.brightness,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(fontSize: 12),
            hintStyle: TextStyle(fontSize: 12, color: Color(0xff666666)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

          ),
        );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length > 0) {
      return SearchPage(
          keyword: query, searchHistoryModel: _searchHistoryModel);
    }
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchHistoryModel>.value(
            value: _searchHistoryModel),
        ChangeNotifierProvider<SearchHotModel>.value(value: _searchHotModel),
      ],
      child: SearchSuggestions(
        delegate: this,
      ),
    );
  }

  @override
  void close(BuildContext context, result) {
    _searchHotModel.dispose();
    _searchHistoryModel.dispose();
    super.close(context, result);
  }
}
