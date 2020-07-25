import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sevencomic/entity/comic_detail_entity.dart';
import 'package:sevencomic/entity/history_entity.dart';
import 'package:sevencomic/manager/router_manager.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/provider/view_state_widget.dart';
import 'package:sevencomic/view_model/comic_detail_model.dart';
import 'package:sevencomic/view_model/history_model.dart';

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
    var coverHeight = MediaQuery.of(context).size.width / 2;

    return ProviderWidget<ComicDetailModel>(
      model: ComicDetailModel(),
      onModelReady: (detailModel) {
        detailModel.loadData(widget.comicId);
      },
      builder: (context, detailModel, child) {
        return Scaffold(
          body: detailModel.isBusy
              ? ViewStateLoadingWidget()
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(),
                    SliverAppBar(
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          height: coverHeight,
                          child: DetailHeadWidget(),
                        ),
                      ),
                      expandedHeight: coverHeight,
                      pinned: true,
                    ),
                    SliverToBoxAdapter(
                      child: DetailIntroWidget(),
                    ),
                    SliverToBoxAdapter(
                      child: DetailChapterWidget(),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class DetailHeadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ComicDetailModel model = Provider.of(context);
    return Stack(
      children: [
        Image(
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            image: NetworkImage(model.detail.cover,
                headers: {"Referer": "http://v3api.dmzj.com/"})),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87]),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 15,
            child: Text(
              "${model.detail.authors.map((e) => e.tagName).join("、")}  •  ${model.detail.types.map((e) => e.tagName).join(" ")}",
              style: TextStyle(color: Color(0xffcccccc), fontSize: 12),
            )),
        Positioned(
            bottom: 30,
            left: 15,
            child: Text(
              model.detail.title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

class DetailIntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ComicDetailModel model = Provider.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.detail.status.map((e) => e.tagName).join(" • "),
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            model.detail.description,
            style: TextStyle(fontSize: 14, color: Color(0xff999999)),
          )
        ],
      ),
    );
  }
}

class DetailChapterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ComicDetailModel model = Provider.of(context);
    return (model.detail.chapters.length > 0)
        ? Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Text(
                      "全部章节(${model.detail.chapters[0].data.length})",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "升序",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff999999)),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: model.detail.chapters[0].data.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      return ChapterItemWidget(
                        model.detail.chapters[0].data[index],
                        index: index,
                      );
                    }),
              ],
            ),
          )
        : Container();
  }
}

class ChapterItemWidget extends StatelessWidget {
  ComicDetailChaptersData itemData;
  int index;

  ChapterItemWidget(this.itemData, {this.index})
      : super(key: ValueKey(itemData.chapterId));

  @override
  Widget build(BuildContext context) {
    ComicDetailModel model = Provider.of(context);
    GlobalHistoryStateModel historyStateModel = Provider.of(context);

    return ProviderWidget<HistoryModel>(
      model: HistoryModel(model: historyStateModel),
      onModelReady: (his) {
        his.getHistoryById(model.detail.id.toString(), itemData.chapterId.toString());
      },
      builder: (context, globalModel, child) {

        return InkWell(
          onTap: () async {
            globalModel.addReadMap(itemData.chapterId.toString());
            globalModel.addHistory(HistoryEntity().fromJson({
              'comicId': model.detail.id.toString(),
              'comicTitle': model.detail.title,
              'chapterId': itemData.chapterId.toString(),
              'readChapter': itemData.chapterTitle,
              'latestChapter': model.detail.chapters[0].data.first.chapterTitle,
              'readTime': "${DateTime.now()}",
              'comicImg': model.detail.cover
            }));
            Navigator.of(context).pushNamed(RouterName.read, arguments: [model.detail.id.toString(), index, model.detail.chapters[0].data]);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: historyStateModel.readMap.containsKey(itemData.chapterId.toString()) ? Colors.blue : Color(0xff999999), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Text(
              itemData.chapterTitle,
              style: TextStyle(fontSize: 14, color: historyStateModel.readMap.containsKey(itemData.chapterId.toString()) ? Colors.blue : Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
