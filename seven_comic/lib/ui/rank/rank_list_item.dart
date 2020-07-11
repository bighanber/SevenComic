import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/entity/index_entity.dart';
import 'package:sevencomic/entity/index_rank_entity.dart';
import 'package:sevencomic/manager/router_manager.dart';

class RankItemWidget extends StatelessWidget {
  IndexRankEntity data;
  int index;

  RankItemWidget(this.data, {this.index})
      : super(key: ValueKey(data.comicId));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouterName.comicDetail, arguments: data.comicId);
      },
      child: Container(
        height: 140,
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 3 / 4,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(data.cover,
                  headers: {"Referer": "http://v3api.dmzj.com/"}),
            ),),

            SizedBox(width: 6,),

            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title, style: TextStyle(fontSize: 17, color: Color(0xff333333)), softWrap: true,),

                Text("${data.authors}\n${data.types}\n${data.status}", style: TextStyle(fontSize: 12, color: Color(0xff999999)),)
              ],
            ),),

          ],
        ),
      ),
    );
  }
}
