import 'package:sevencomic/entity/comic_detail_entity.dart';
import 'package:sevencomic/entity/index_rank_entity.dart';
import 'package:sevencomic/net/api_response.dart';
import 'package:sevencomic/provider/view_state_model.dart';
import 'package:sevencomic/provider/view_state_refresh_list_model.dart';
import 'package:sevencomic/repository.dart';

class ComicRankModel extends ViewStateRefreshListModel {
//  List<IndexRankEntity> _rankList;
//
//  List<IndexRankEntity> get rankList => _rankList;

  int type;

  ComicRankModel(this.type);

  @override
  Future<List> loadData({int pageNum}) async {
    try {
      var entity = await Repository.getComicRank(type, pageNum);
      if (entity.status == Status.COMPLETED) {
        setIdle();
        return entity.data.index;
      } else {
        throw Exception(entity.exception);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//  loadData(int type, int page) async {
//    setBusy();
//    try {
//      var entity = await Repository.getComicRank(type, page);
//      if (entity.status == Status.COMPLETED) {
//        setIdle();
//        _rankList = entity.data.index;
//      } else {
//        setError(entity.exception);
//      }
//    } catch (e) {
//      setError(e);
//    }
//  }

}
