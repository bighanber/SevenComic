import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class ComicDetailEntity with JsonConvert<ComicDetailEntity> {
	int id;
	int islong;
	int direction;
	String title;
	@JSONField(name: "is_dmzj")
	int isDmzj;
	String cover;
	String description;
	@JSONField(name: "last_updatetime")
	int lastUpdatetime;
	@JSONField(name: "last_update_chapter_name")
	String lastUpdateChapterName;
	int copyright;
	@JSONField(name: "first_letter")
	String firstLetter;
	@JSONField(name: "comic_py")
	String comicPy;
	int hidden;
	@JSONField(name: "hot_num")
	int hotNum;
	@JSONField(name: "hit_num")
	int hitNum;
	dynamic uid;
	@JSONField(name: "is_lock")
	int isLock;
	@JSONField(name: "last_update_chapter_id")
	int lastUpdateChapterId;
	List<ComicDetailStatu> status;
	List<ComicDetailType> types;
	List<ComicDetailAuthor> authors;
	@JSONField(name: "subscribe_num")
	int subscribeNum;
	List<ComicDetailChapter> chapters;
	ComicDetailComment comment;
	@JSONField(name: "url_links")
	List<dynamic> urlLinks;
	String isHideChapter;
	@JSONField(name: "dh_url_links")
	List<ComicDetailDhUrlLink> dhUrlLinks;
	@JSONField(name: "is_dot")
	String isDot;
}

class ComicDetailStatu with JsonConvert<ComicDetailStatu> {
	@JSONField(name: "tag_id")
	int tagId;
	@JSONField(name: "tag_name")
	String tagName;
}

class ComicDetailType with JsonConvert<ComicDetailType> {
	@JSONField(name: "tag_id")
	int tagId;
	@JSONField(name: "tag_name")
	String tagName;
}

class ComicDetailAuthor with JsonConvert<ComicDetailAuthor> {
	@JSONField(name: "tag_id")
	int tagId;
	@JSONField(name: "tag_name")
	String tagName;
}

class ComicDetailChapter with JsonConvert<ComicDetailChapter> {
	String title;
	List<ComicDetailChaptersData> data;
}

class ComicDetailChaptersData with JsonConvert<ComicDetailChaptersData> {
	@JSONField(name: "chapter_id")
	int chapterId;
	@JSONField(name: "chapter_title")
	String chapterTitle;
	int updatetime;
	int filesize;
	@JSONField(name: "chapter_order")
	int chapterOrder;
}

class ComicDetailComment with JsonConvert<ComicDetailComment> {
	@JSONField(name: "comment_count")
	int commentCount;
	@JSONField(name: "latest_comment")
	List<ComicDetailCommantLatestCommant> latestComment;
}

class ComicDetailCommantLatestCommant with JsonConvert<ComicDetailCommantLatestCommant> {
	@JSONField(name: "comment_id")
	int commentId;
	int uid;
	String content;
	int createtime;
	String nickname;
	String avatar;
}

class ComicDetailDhUrlLink with JsonConvert<ComicDetailDhUrlLink> {
	String title;
	@JSONField(name: "list")
	List<dynamic> xList;
}
