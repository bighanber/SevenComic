import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sevencomic/view_model/favorite_model.dart';
import 'package:sevencomic/view_model/history_model.dart';
import 'package:sevencomic/view_model/theme_model.dart';

List<SingleChildWidget> providers = [...independentServices];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
  ),
  ChangeNotifierProvider<GlobalFavoriteStateModel>(
    create: (context) => GlobalFavoriteStateModel(),
  ),
  ChangeNotifierProvider<GlobalHistoryStateModel>(
    create: (context) => GlobalHistoryStateModel(),
  )
];
