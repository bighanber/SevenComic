import 'package:sevencomic/entity/chapter_detail_entity.dart';
import 'package:sevencomic/net/api_response.dart';
import 'package:sevencomic/provider/view_state_model.dart';
import 'package:sevencomic/repository.dart';

class ChapterDetailModel extends ViewStateModel {

  ChapterDetailEntity _detail;

  ChapterDetailEntity get detail => _detail;

  loadData(String comicId, String chapterId) async {
    setBusy();
    try {
      var entity = await Repository.getChapterInfo(comicId, chapterId);
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
