import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class IndexUpdateEntity with JsonConvert<IndexUpdateEntity> {
	int id;
	String title;
	double islong;
	String authors;
	String types;
	String cover;
	String status;
	@JSONField(name: "last_update_chapter_name")
	String lastUpdateChapterName;
	@JSONField(name: "last_update_chapter_id")
	double lastUpdateChapterId;
	@JSONField(name: "last_updatetime")
	double lastUpdatetime;
}
