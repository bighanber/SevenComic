import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sevencomic/entity/index_update_entity.dart';
import 'package:sevencomic/manager/router_manager.dart';

class UpdateItemWidget extends StatelessWidget {

  IndexUpdateEntity entity;
  int index;

  UpdateItemWidget(this.entity, {this.index}) : super(key: ValueKey(entity.id));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouterName.comicDetail, arguments: entity.id);
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 0.75,
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(entity.cover,
                    headers: {"Referer": "http://v3api.dmzj.com/"}),
              ),
            ),
            
            SizedBox(height: 6,),

            Text(entity.title, style: TextStyle(fontSize: 14, color: Color(0xff333333),),maxLines: 1,overflow: TextOverflow.ellipsis,),
            Text(entity.lastUpdateChapterName, style: TextStyle(fontSize: 12, color: Color(0xff666666)),),

          ],
        ),
      ),
    );
  }

}