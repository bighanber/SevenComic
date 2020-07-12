import 'package:sevencomic/entity/search_result_entity.dart';

searchResultEntityFromJson(SearchResultEntity data, Map<String, dynamic> json) {
	if (json['_biz'] != null) {
		data.sBiz = json['_biz']?.toString();
	}
	if (json['addtime'] != null) {
		data.addtime = json['addtime']?.toDouble();
	}
	if (json['alias_name'] != null) {
		data.aliasName = json['alias_name']?.toString();
	}
	if (json['authors'] != null) {
		data.authors = json['authors']?.toString();
	}
	if (json['copyright'] != null) {
		data.copyright = json['copyright']?.toDouble();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['device_show'] != null) {
		data.deviceShow = json['device_show']?.toDouble();
	}
	if (json['grade'] != null) {
		data.grade = json['grade']?.toDouble();
	}
	if (json['hidden'] != null) {
		data.hidden = json['hidden']?.toDouble();
	}
	if (json['hot_hits'] != null) {
		data.hotHits = json['hot_hits']?.toDouble();
	}
	if (json['last_name'] != null) {
		data.lastName = json['last_name']?.toString();
	}
	if (json['quality'] != null) {
		data.quality = json['quality']?.toDouble();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toDouble();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['types'] != null) {
		data.types = json['types']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	return data;
}

Map<String, dynamic> searchResultEntityToJson(SearchResultEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_biz'] = entity.sBiz;
	data['addtime'] = entity.addtime;
	data['alias_name'] = entity.aliasName;
	data['authors'] = entity.authors;
	data['copyright'] = entity.copyright;
	data['cover'] = entity.cover;
	data['device_show'] = entity.deviceShow;
	data['grade'] = entity.grade;
	data['hidden'] = entity.hidden;
	data['hot_hits'] = entity.hotHits;
	data['last_name'] = entity.lastName;
	data['quality'] = entity.quality;
	data['status'] = entity.status;
	data['title'] = entity.title;
	data['types'] = entity.types;
	data['id'] = entity.id;
	return data;
}