import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class ComicNewsHeaderEntity with JsonConvert<ComicNewsHeaderEntity> {
	int code;
	String msg;
	List<ComicNewsHeaderData> data;
}

class ComicNewsHeaderData with JsonConvert<ComicNewsHeaderData> {
	int id;
	String title;
	@JSONField(name: "pic_url")
	String picUrl;
	@JSONField(name: "object_id")
	int objectId;
	@JSONField(name: "object_url")
	String objectUrl;
}
