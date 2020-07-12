import 'package:sevencomic/generated/json/base/json_convert_content.dart';
import 'package:sevencomic/generated/json/base/json_filed.dart';

class SearchResultEntity with JsonConvert<SearchResultEntity> {
	@JSONField(name: "_biz")
	String sBiz;
	double addtime;
	@JSONField(name: "alias_name")
	String aliasName;
	String authors;
	double copyright;
	String cover;
	@JSONField(name: "device_show")
	double deviceShow;
	double grade;
	double hidden;
	@JSONField(name: "hot_hits")
	double hotHits;
	@JSONField(name: "last_name")
	String lastName;
	double quality;
	double status;
	String title;
	String types;
	int id;
}
