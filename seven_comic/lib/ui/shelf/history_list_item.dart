import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/entity/history_entity.dart';
import 'package:sevencomic/entity/index_entity.dart';
import 'package:sevencomic/entity/index_rank_entity.dart';
import 'package:sevencomic/manager/router_manager.dart';

class HistoryItemWidget extends StatelessWidget {
  HistoryEntity data;
  int index;

  HistoryItemWidget(this.data, {this.index})
      : super(key: ValueKey(data.comicId));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouterName.comicDetail,
            arguments: int.parse(data.comicId));
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Stack(
          children: [
            Row(
              children: [
                AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(data.comicImg,
                        headers: {"Referer": "http://v3api.dmzj.com/"}),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.comicTitle,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff333333)),
                        softWrap: true,
                      ),
                      Text(
                        "${data.readChapter}/${data.latestChapter}",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff999999)),
                      ),
                      Expanded(child: SizedBox.shrink()),
                      Text(
                        data.readTime,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff999999)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: OutlineButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                borderSide: BorderSide(
                    color: Colors.blue, width: 0.5, style: BorderStyle.solid),
                textColor: Colors.blue,
                child: Text(
                  "续看",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
