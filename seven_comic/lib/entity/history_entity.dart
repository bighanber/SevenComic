import 'package:sevencomic/generated/json/base/json_convert_content.dart';

class HistoryEntity with JsonConvert<HistoryEntity> {
	String comicId;
	String comicTitle;
	String readChapter;
	String latestChapter;
	String readTime;
	String comicImg;
}
