import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sevencomic/manager/resource_mananger.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/provider/view_state_widget.dart';
import 'package:sevencomic/view_model/chapter_detail_model.dart';

class ComicReadPage extends StatefulWidget {
  String comicId;
  String chapterId;

  ComicReadPage({@required this.comicId, this.chapterId});

  @override
  State<StatefulWidget> createState() {
    return _ComicReadPage();
  }
}

class _ComicReadPage extends State<ComicReadPage> {
  PageController _controller = new PageController();
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ChapterDetailModel>(
      onModelReady: (model) {
        model.loadData(widget.comicId, widget.chapterId);
      },
      builder: (context, model, child) {
        if (model.isBusy) {
          return ViewStateLoadingWidget();
        }

        return Stack(
          children: [
            PhotoViewGallery.builder(
              builder: ((context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider:  NetworkImage(model.detail.pageUrl[index],
                    headers: {"Referer": "http://v3api.dmzj.com/"},
                  ),
                  heroAttributes: PhotoViewHeroAttributes(tag: model.detail.pageUrl[index]),
                );
              }),
              itemCount: model.detail.pageUrl.length,
              scrollDirection: Axis.horizontal,
              loadingBuilder: (context, event) {
                return Center(
                  child: ViewStateLoadingWidget(),
                );
              },
              pageController: _controller,
              scrollPhysics: PageScrollPhysics(parent: BouncingScrollPhysics()),
              onPageChanged: (index) {
                setState(() {
                  curIndex = index;
                });
              },
            ),

            Align(
              alignment: Alignment.bottomRight,
              child:  Text("image ${curIndex + 1}", style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
          ],
        );
      },
      model: ChapterDetailModel(),
    );
  }
}
