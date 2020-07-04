import 'package:sevencomic/entity/comic_detail_entity.dart';
import 'package:sevencomic/net/api_response.dart';
import 'package:sevencomic/provider/view_state_model.dart';
import 'package:sevencomic/repository.dart';

class ComicDetailModel extends ViewStateModel {

  ComicDetailEntity _detail;

  ComicDetailEntity get detail => _detail;

  loadData(int comicId) async {
    setBusy();
    try {
      var entity = await Repository.getComicDetail(comicId);
      if (entity.status == Status.COMPLETED) {
        setIdle();
        _detail = entity.data;
      } else {
        setError(entity.exception);
      }
    } catch (e) {
      setError(e);
    }
  }
}
