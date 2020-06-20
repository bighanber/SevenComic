import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class IndexList {
	final List<IndexEntity> index;

	IndexList({this.index});

	factory IndexList.fromJson(List<dynamic> parsedJson) {

		List<IndexEntity> list = new List<IndexEntity>();
		list = parsedJson.map((i)=>IndexEntity().fromJson(i)).toList();

		return new IndexList(
				index: list
		);
	}
}

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
