import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class ChapterDetailEntity with JsonConvert<ChapterDetailEntity> {
	@JSONField(name: "chapter_id")
	int chapterId;
	@JSONField(name: "comic_id")
	int comicId;
	String title;
	@JSONField(name: "chapter_order")
	int chapterOrder;
	int direction;
	@JSONField(name: "page_url")
	List<String> pageUrl;
	int picnum;
	@JSONField(name: "comment_count")
	int commentCount;
}
