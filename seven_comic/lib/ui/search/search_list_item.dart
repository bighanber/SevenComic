import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/entity/index_entity.dart';
import 'package:sevencomic/entity/index_rank_entity.dart';
import 'package:sevencomic/entity/search_result_entity.dart';
import 'package:sevencomic/manager/router_manager.dart';

class SearchItemWidget extends StatelessWidget {
  SearchResultEntity data;
  int index;

  SearchItemWidget(this.data, {this.index}) : super(key: ValueKey(data.id));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouterName.comicDetail, arguments: data.id);
      },
      child: Container(
        height: 90,
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(data.cover,
                        headers: {"Referer": "http://v3api.dmzj.com/"}),
                  )
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 15, color: Color(0xff333333), fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                  Text(
                    "${data.authors}\n${data.types}\n${data.lastName}",
                    style: TextStyle(fontSize: 11, color: Color(0xff999999)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
