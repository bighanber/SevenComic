import 'package:sevencomic/entity/chapter_detail_entity.dart';

chapterDetailEntityFromJson(ChapterDetailEntity data, Map<String, dynamic> json) {
	if (json['chapter_id'] != null) {
		data.chapterId = json['chapter_id']?.toInt();
	}
	if (json['comic_id'] != null) {
		data.comicId = json['comic_id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['chapter_order'] != null) {
		data.chapterOrder = json['chapter_order']?.toInt();
	}
	if (json['direction'] != null) {
		data.direction = json['direction']?.toInt();
	}
	if (json['page_url'] != null) {
		data.pageUrl = json['page_url']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['picnum'] != null) {
		data.picnum = json['picnum']?.toInt();
	}
	if (json['comment_count'] != null) {
		data.commentCount = json['comment_count']?.toInt();
	}
	return data;
}

Map<String, dynamic> chapterDetailEntityToJson(ChapterDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['chapter_id'] = entity.chapterId;
	data['comic_id'] = entity.comicId;
	data['title'] = entity.title;
	data['chapter_order'] = entity.chapterOrder;
	data['direction'] = entity.direction;
	data['page_url'] = entity.pageUrl;
	data['picnum'] = entity.picnum;
	data['comment_count'] = entity.commentCount;
	return data;
}