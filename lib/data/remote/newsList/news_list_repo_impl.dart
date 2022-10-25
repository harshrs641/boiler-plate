import 'package:boiler_plate/core/core.dart';
import 'package:boiler_plate/data/remote/remote.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsListRepoImpl implements BaseNewsListRepo {
  final ApiClient _apiClient;

  NewsListRepoImpl(this._apiClient);
  @override
  Future<Either<ApiException, NewsListResponse>> getNewsList(
      String categoryName,) async {
    try {
      final response = await _apiClient.get(
        "/${ApiClient.TOP_HEADLINES}?country=in&apiKey=${dotenv.env['API_KEY']}&category=$categoryName",
      );
      return Right(NewsListResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
