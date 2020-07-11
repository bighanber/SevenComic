import 'package:sevencomic/entity/index_rank_entity.dart';

indexRankEntityFromJson(IndexRankEntity data, Map<String, dynamic> json) {
	if (json['comic_id'] != null) {
		data.comicId = json['comic_id']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['authors'] != null) {
		data.authors = json['authors']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['types'] != null) {
		data.types = json['types']?.toString();
	}
	if (json['last_updatetime'] != null) {
		data.lastUpdatetime = json['last_updatetime']?.toString();
	}
	if (json['last_update_chapter_name'] != null) {
		data.lastUpdateChapterName = json['last_update_chapter_name']?.toString();
	}
	if (json['comic_py'] != null) {
		data.comicPy = json['comic_py']?.toString();
	}
	if (json['num'] != null) {
		data.num = json['num']?.toString();
	}
	if (json['tag_id'] != null) {
		data.tagId = json['tag_id']?.toString();
	}
	return data;
}

Map<String, dynamic> indexRankEntityToJson(IndexRankEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['comic_id'] = entity.comicId;
	data['title'] = entity.title;
	data['authors'] = entity.authors;
	data['status'] = entity.status;
	data['cover'] = entity.cover;
	data['types'] = entity.types;
	data['last_updatetime'] = entity.lastUpdatetime;
	data['last_update_chapter_name'] = entity.lastUpdateChapterName;
	data['comic_py'] = entity.comicPy;
	data['num'] = entity.num;
	data['tag_id'] = entity.tagId;
	return data;
}