import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class IndexEntity with JsonConvert<IndexEntity> {
	@JSONField(name: "category_id")
	double categoryId;
	String title;
	double sort;
	List<IndexData> data;
}

class IndexData with JsonConvert<IndexData> {
	String cover;
	String title;
	@JSONField(name: "sub_title")
	String subTitle;
	double type;
	String url;
	@JSONField(name: "obj_id")
	double objId;
	String status;
}
