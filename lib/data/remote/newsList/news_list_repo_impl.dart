import 'package:boiler_plate/core/core.dart';
import 'package:boiler_plate/data/local/new_list_storage.dart';
import 'package:boiler_plate/data/remote/remote.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsListRepoImpl implements BaseNewsListRepo {
  final ApiClient _apiClient;

  NewsListRepoImpl(this._apiClient);
  @override
  Future<Either<ApiException, NewsListResponse>> getNewsList(
    String categoryName,
  ) async {
    try {
      final response = await _apiClient.get(
        "/${ApiClient.TOP_HEADLINES}?apiKey=${dotenv.env['API_KEY']}&category=$categoryName",
      );
      final data = NewsListResponse.fromJson(response.data!);
      NewsListLocalStorage.writeToStorage(data);
      return Right(data);
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
