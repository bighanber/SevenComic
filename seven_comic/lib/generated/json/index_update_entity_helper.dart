import 'package:sevencomic/entity/index_update_entity.dart';

indexUpdateEntityFromJson(IndexUpdateEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['islong'] != null) {
		data.islong = json['islong']?.toDouble();
	}
	if (json['authors'] != null) {
		data.authors = json['authors']?.toString();
	}
	if (json['types'] != null) {
		data.types = json['types']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['last_update_chapter_name'] != null) {
		data.lastUpdateChapterName = json['last_update_chapter_name']?.toString();
	}
	if (json['last_update_chapter_id'] != null) {
		data.lastUpdateChapterId = json['last_update_chapter_id']?.toDouble();
	}
	if (json['last_updatetime'] != null) {
		data.lastUpdatetime = json['last_updatetime']?.toDouble();
	}
	return data;
}

Map<String, dynamic> indexUpdateEntityToJson(IndexUpdateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['islong'] = entity.islong;
	data['authors'] = entity.authors;
	data['types'] = entity.types;
	data['cover'] = entity.cover;
	data['status'] = entity.status;
	data['last_update_chapter_name'] = entity.lastUpdateChapterName;
	data['last_update_chapter_id'] = entity.lastUpdateChapterId;
	data['last_updatetime'] = entity.lastUpdatetime;
	return data;
}