import 'package:sevencomic/entity/comic_news_entity.dart';

comicNewsEntityFromJson(ComicNewsEntity data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['from_name'] != null) {
		data.fromName = json['from_name']?.toString();
	}
	if (json['from_url'] != null) {
		data.fromUrl = json['from_url']?.toString();
	}
	if (json['create_time'] != null) {
		data.createTime = json['create_time']?.toDouble();
	}
	if (json['is_foreign'] != null) {
		data.isForeign = json['is_foreign']?.toDouble();
	}
	if (json['foreign_url'] != null) {
		data.foreignUrl = json['foreign_url']?.toString();
	}
	if (json['intro'] != null) {
		data.intro = json['intro']?.toString();
	}
	if (json['author_id'] != null) {
		data.authorId = json['author_id']?.toDouble();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toDouble();
	}
	if (json['row_pic_url'] != null) {
		data.rowPicUrl = json['row_pic_url']?.toString();
	}
	if (json['col_pic_url'] != null) {
		data.colPicUrl = json['col_pic_url']?.toString();
	}
	if (json['qchat_show'] != null) {
		data.qchatShow = json['qchat_show']?.toDouble();
	}
	if (json['article_id'] != null) {
		data.articleId = json['article_id']?.toDouble();
	}
	if (json['page_url'] != null) {
		data.pageUrl = json['page_url']?.toString();
	}
	if (json['comment_amount'] != null) {
		data.commentAmount = json['comment_amount']?.toString();
	}
	if (json['author_uid'] != null) {
		data.authorUid = json['author_uid']?.toDouble();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname']?.toString();
	}
	if (json['mood_amount'] != null) {
		data.moodAmount = json['mood_amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> comicNewsEntityToJson(ComicNewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['from_name'] = entity.fromName;
	data['from_url'] = entity.fromUrl;
	data['create_time'] = entity.createTime;
	data['is_foreign'] = entity.isForeign;
	data['foreign_url'] = entity.foreignUrl;
	data['intro'] = entity.intro;
	data['author_id'] = entity.authorId;
	data['status'] = entity.status;
	data['row_pic_url'] = entity.rowPicUrl;
	data['col_pic_url'] = entity.colPicUrl;
	data['qchat_show'] = entity.qchatShow;
	data['article_id'] = entity.articleId;
	data['page_url'] = entity.pageUrl;
	data['comment_amount'] = entity.commentAmount;
	data['author_uid'] = entity.authorUid;
	data['cover'] = entity.cover;
	data['nickname'] = entity.nickname;
	data['mood_amount'] = entity.moodAmount;
	return data;
}