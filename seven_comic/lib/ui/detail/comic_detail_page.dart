import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/entity/comic_detail_entity.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/view_model/comic_detail_model.dart';

class ComicDetailPage extends StatefulWidget {
  int comicId;

  ComicDetailPage(this.comicId);

  @override
  State<StatefulWidget> createState() {
    return _ComicDetailPage();
  }
}

class _ComicDetailPage extends State<ComicDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ComicDetailModel>(
      model: ComicDetailModel(),
      onModelReady: (detailModel) {
        detailModel.loadData(widget.comicId);
      },
      builder: (context, detailModel, child) {
        return Container(
          color: Colors.cyan,
          child: detailModel.isBusy ? Text("loading") : Text(detailModel.detail.title),
        );
      },
    );
  }
}
