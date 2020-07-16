import 'package:sevencomic/generated/json/base/json_convert_content.dart';

class FavoriteEntity with JsonConvert<FavoriteEntity> {
	String comicId;
	String comicTitle;
	String readChapter;
	String latestChapter;
	String updateTime;
	//用于添加顺序
	String addId;
	String readTime;
	String comicImg;
}
