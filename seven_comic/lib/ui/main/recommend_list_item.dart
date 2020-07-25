import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/entity/index_entity.dart';
import 'package:sevencomic/manager/router_manager.dart';

class RecommendItemWidget extends StatelessWidget {
  IndexEntity data;
  int index;

  RecommendItemWidget(this.data, {this.index})
      : super(key: ValueKey(data.categoryId));

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    UniqueKey key = UniqueKey();

    return Material(
      color: backgroundColor,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Text(
                data.title,
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w500),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: data.data.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (data.sort == 5 || data.sort == 9 || data.sort == 11) ? 2 : 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio:
                      (data.sort == 5 || data.sort == 9 || data.sort == 11) ? 1.8 : 0.56,
                ),
                itemBuilder: (context, index) {
                  IndexData item = data.data[index];
                  return RecommendSubItemWidget(
                    item,
                    index: index,
                    sort: data.sort,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class RecommendSubItemWidget extends StatelessWidget {
  IndexData data;
  int index;
  double sort;

  RecommendSubItemWidget(this.data, {this.index, this.sort})
      : super(key: ValueKey(data.objId));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouterName.comicDetail, arguments: data.objId);
      },
      child: Container(
        child: (sort != 5 && sort != 9 && sort != 11)
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    fit: BoxFit.fill,
                    height: 140,
                    image: NetworkImage(data.cover,
                        headers: {"Referer": "http://v3api.dmzj.com/"}),
                  ),
                  Text(data.title, style: TextStyle(fontSize: 14, color: Color(0xff333333),),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text(data.status, style: TextStyle(fontSize: 12, color: Color(0xff666666)),),
                ],
              )
            : Image(
                fit: BoxFit.fill,
                image: NetworkImage(data.cover,
                    headers: {"Referer": "http://v3api.dmzj.com/"}),
              ),
      ),
    );
  }
}
