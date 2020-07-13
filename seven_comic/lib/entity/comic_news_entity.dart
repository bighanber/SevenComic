import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class ComicNewsEntity with JsonConvert<ComicNewsEntity> {
	String title;
	@JSONField(name: "from_name")
	String fromName;
	@JSONField(name: "from_url")
	String fromUrl;
	@JSONField(name: "create_time")
	double createTime;
	@JSONField(name: "is_foreign")
	double isForeign;
	@JSONField(name: "foreign_url")
	String foreignUrl;
	String intro;
	@JSONField(name: "author_id")
	double authorId;
	double status;
	@JSONField(name: "row_pic_url")
	String rowPicUrl;
	@JSONField(name: "col_pic_url")
	String colPicUrl;
	@JSONField(name: "qchat_show")
	double qchatShow;
	@JSONField(name: "article_id")
	double articleId;
	@JSONField(name: "page_url")
	String pageUrl;
	@JSONField(name: "comment_amount")
	String commentAmount;
	@JSONField(name: "author_uid")
	double authorUid;
	String cover;
	String nickname;
	@JSONField(name: "mood_amount")
	double moodAmount;
}
