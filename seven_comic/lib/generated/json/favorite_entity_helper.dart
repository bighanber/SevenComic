import 'package:sevencomic/entity/favorite_entity.dart';

favoriteEntityFromJson(FavoriteEntity data, Map<String, dynamic> json) {
	if (json['comicId'] != null) {
		data.comicId = json['comicId']?.toString();
	}
	if (json['comicTitle'] != null) {
		data.comicTitle = json['comicTitle']?.toString();
	}
	if (json['readChapter'] != null) {
		data.readChapter = json['readChapter']?.toString();
	}
	if (json['latestChapter'] != null) {
		data.latestChapter = json['latestChapter']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['addId'] != null) {
		data.addId = json['addId']?.toString();
	}
	if (json['readTime'] != null) {
		data.readTime = json['readTime']?.toString();
	}
	if (json['comicImg'] != null) {
		data.comicImg = json['comicImg']?.toString();
	}
	return data;
}

Map<String, dynamic> favoriteEntityToJson(FavoriteEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['comicId'] = entity.comicId;
	data['comicTitle'] = entity.comicTitle;
	data['readChapter'] = entity.readChapter;
	data['latestChapter'] = entity.latestChapter;
	data['updateTime'] = entity.updateTime;
	data['addId'] = entity.addId;
	data['readTime'] = entity.readTime;
	data['comicImg'] = entity.comicImg;
	return data;
}