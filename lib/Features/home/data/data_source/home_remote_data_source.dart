import 'package:bookly/Features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/core/utils/api_service.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await _apiService.get(
        endpoint: "volumes?q=subject: Programming&filter=free-ebooks");

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await _apiService.get(
        endpoint: "volumes?q=subject: Programming&filter=free-ebooks&orderBy=newest");

    List<BookEntity> books = getBooksList(data);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
