import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sevencomic/manager/resource_mananger.dart';
import 'package:sevencomic/provider/provider_widget.dart';
import 'package:sevencomic/provider/view_state_widget.dart';
import 'package:sevencomic/util/net_utils.dart';
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
  String netInfo;

  @override
  void initState() {
    super.initState();
    NetUtils.getNetInfo().then((value) => netInfo = value);
//    _controller.addListener(() {
//
//    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    DateTime curTime = DateTime.now();
    double progressValue = 0;
    bool opVisible = false;

    return ProviderWidget<ChapterDetailModel>(
      onModelReady: (model) {
        model.loadData(widget.comicId, widget.chapterId);
      },
      builder: (context, model, child) {
        if (model.isBusy) {
          return ViewStateLoadingWidget();
        }

        return Scaffold(
          body: Stack(
            children: [
              GestureDetector(
                child: Container(
                  child: PhotoViewGallery.builder(
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
                ),
                onPanDown: (details) {
                  print("x: ${details.globalPosition.dx} - y: ${details.globalPosition.dy}");
                  int res = clickArea(details.globalPosition.dx);
                  print("res: ${res}");
                  if (res == 0) {
                    opVisible = !opVisible;
                    print("opVisible: ${opVisible}");
                    model.notifyListeners();
                  }
                },
              ),

              Align(
                alignment: Alignment.bottomRight,
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(model.detail.title, style: TextStyle(fontSize: 12, color: Colors.white),),
                    SizedBox(width: 5,),
                    Text("${curIndex + 1}/${model.detail.pageUrl.length}", style: TextStyle(fontSize: 12, color: Colors.white),),
                    SizedBox(width: 5,),
                    Text(netInfo ?? "未知", style: TextStyle(fontSize: 12, color: Colors.white),),
                    SizedBox(width: 5,),
                    Text("${curTime.hour}:${curTime.minute}", style: TextStyle(fontSize: 12, color: Colors.white),),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Visibility(
                  visible: opVisible,
                    child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black87,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () {
                          Navigator.of(context).pop();
                        }),
                      ),
                    ],
                  ),
                )),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Visibility(
                  visible: opVisible,
                  child: Container(
                  height: 50,
                  color: Colors.black87,
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Text("上一话", style: TextStyle(color: Colors.white),),
                      Expanded(child: Slider(
                          min: 0.0,
                          max: model.detail.picnum.toDouble(),
                          value: curIndex.toDouble(),
                          divisions: model.detail.picnum,
                          onChanged: (v) {
                            setState(() {
                              _controller.animateToPage(v.floor(), duration: Duration(milliseconds: 200), curve: Curves.linear);
                            });

                          })),
                      Text("下一话", style: TextStyle(color: Colors.white),),
                      SizedBox(width: 15,),
                    ],
                  ),
                ),
                ),
              ),
            ],
          ),
        );
      },
      model: ChapterDetailModel(),
    );
  }

  int clickArea(double x) {
    double width = MediaQuery.of(context).size.width;
    double left = width / 3.0;
    double mid = (2 * width) / 3.0;

    if (x <= left) {
      return -1;
    } else if (x > left && x <= mid) {
      return 0;
    } else {
      return 1;
    }
  }
}
