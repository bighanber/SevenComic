import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sevencomic/view_model/favourite_model.dart';
import 'package:sevencomic/view_model/theme_model.dart';

List<SingleChildWidget> providers = [
  ...independentServices
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
  ),
  ChangeNotifierProvider<GlobalFavouriteStateModel>(
    create: (context) => GlobalFavouriteStateModel(),
  )
];
