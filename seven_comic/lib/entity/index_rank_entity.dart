import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class IndexRankEntity with JsonConvert<IndexRankEntity> {
	@JSONField(name: "comic_id")
	String comicId;
	String title;
	String authors;
	String status;
	String cover;
	String types;
	@JSONField(name: "last_updatetime")
	String lastUpdatetime;
	@JSONField(name: "last_update_chapter_name")
	String lastUpdateChapterName;
	@JSONField(name: "comic_py")
	String comicPy;
	String num;
	@JSONField(name: "tag_id")
	String tagId;
}
