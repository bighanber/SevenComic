import 'package:sevencomic/entity/history_entity.dart';

historyEntityFromJson(HistoryEntity data, Map<String, dynamic> json) {
	if (json['comicId'] != null) {
		data.comicId = json['comicId']?.toString();
	}
	if (json['comicTitle'] != null) {
		data.comicTitle = json['comicTitle']?.toString();
	}
	if (json['chapterId'] != null) {
		data.chapterId = json['chapterId']?.toString();
	}
	if (json['readChapter'] != null) {
		data.readChapter = json['readChapter']?.toString();
	}
	if (json['latestChapter'] != null) {
		data.latestChapter = json['latestChapter']?.toString();
	}
	if (json['readTime'] != null) {
		data.readTime = json['readTime']?.toString();
	}
	if (json['comicImg'] != null) {
		data.comicImg = json['comicImg']?.toString();
	}
	return data;
}

Map<String, dynamic> historyEntityToJson(HistoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['comicId'] = entity.comicId;
	data['comicTitle'] = entity.comicTitle;
	data['chapterId'] = entity.chapterId;
	data['readChapter'] = entity.readChapter;
	data['latestChapter'] = entity.latestChapter;
	data['readTime'] = entity.readTime;
	data['comicImg'] = entity.comicImg;
	return data;
}