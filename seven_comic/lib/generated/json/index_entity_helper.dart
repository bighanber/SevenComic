import 'package:sevencomic/entity/index_entity.dart';

indexEntityFromJson(IndexEntity data, Map<String, dynamic> json) {
	if (json['category_id'] != null) {
		data.categoryId = json['category_id']?.toDouble();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['sort'] != null) {
		data.sort = json['sort']?.toDouble();
	}
	if (json['data'] != null) {
		data.data = new List<IndexData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new IndexData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> indexEntityToJson(IndexEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['category_id'] = entity.categoryId;
	data['title'] = entity.title;
	data['sort'] = entity.sort;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

indexDataFromJson(IndexData data, Map<String, dynamic> json) {
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['sub_title'] != null) {
		data.subTitle = json['sub_title']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toDouble();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['obj_id'] != null) {
		data.objId = json['obj_id']?.toInt();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	return data;
}

Map<String, dynamic> indexDataToJson(IndexData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cover'] = entity.cover;
	data['title'] = entity.title;
	data['sub_title'] = entity.subTitle;
	data['type'] = entity.type;
	data['url'] = entity.url;
	data['obj_id'] = entity.objId;
	data['status'] = entity.status;
	return data;
}