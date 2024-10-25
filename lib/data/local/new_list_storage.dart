import 'package:boiler_plate/data/remote/newsList/models/news_list_model.dart';
import 'package:boiler_plate/services/shared_preference_service.dart';

class NewsListLocalStorage {
  static const key = "news_list";
  static Future<void> writeToStorage(NewsListResponse list) async {
    final value = newsListResponseToJson(list);
    await SharedPreferenceService.setString(key, value);
  }

  static NewsListResponse? readFromStorage() {
    final value = SharedPreferenceService.getString(key);
    if (value?.isEmpty ?? true) return null;
    return newsListResponseFromJson(value!);
  }
}
