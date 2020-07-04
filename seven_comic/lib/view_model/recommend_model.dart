import 'package:sevencomic/entity/index_entity.dart';
import 'package:sevencomic/entity/index_recommend.dart';
import 'package:sevencomic/net/api_response.dart';
import 'package:sevencomic/provider/view_state_list_model.dart';
import 'package:sevencomic/provider/view_state_model.dart';

import '../repository.dart';

class RecommendModel extends ViewStateListModel {

  List<IndexData> _banners;
  List<IndexEntity> _content;

  List<IndexData> get banners => _banners;
  List<IndexEntity> get content => _content;

  @override
  Future<List> loadData() async {
    ApiResponse<IndexList> entity = await Repository.getCategories();
    _banners = entity.data.index[0].data;
    entity.data.index.removeAt(0);
    _content = entity.data.index;
    return entity.data.index;
  }

}