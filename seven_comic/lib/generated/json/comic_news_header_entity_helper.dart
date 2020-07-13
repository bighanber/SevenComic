import 'package:sevencomic/entity/comic_news_header_entity.dart';

comicNewsHeaderEntityFromJson(ComicNewsHeaderEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<ComicNewsHeaderData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ComicNewsHeaderData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> comicNewsHeaderEntityToJson(ComicNewsHeaderEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

comicNewsHeaderDataFromJson(ComicNewsHeaderData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['pic_url'] != null) {
		data.picUrl = json['pic_url']?.toString();
	}
	if (json['object_id'] != null) {
		data.objectId = json['object_id']?.toInt();
	}
	if (json['object_url'] != null) {
		data.objectUrl = json['object_url']?.toString();
	}
	return data;
}

Map<String, dynamic> comicNewsHeaderDataToJson(ComicNewsHeaderData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['pic_url'] = entity.picUrl;
	data['object_id'] = entity.objectId;
	data['object_url'] = entity.objectUrl;
	return data;
}