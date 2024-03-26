import 'package:bookly/Features/home/data/models/book_model/book_model/book_model.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';

import '../../../../core/utils/functions/save_books_data.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageIndex = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageIndex = 0}) async {
    var data = await _apiService.get(
        endpoint:
            "volumes?q=subject:Programming&Filtering=free-ebooks&startIndex=${pageIndex * 10}");

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await _apiService.get(
        endpoint: "volumes?q=Programming&filter=free-ebooks&orderBy=newest");

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kNewestBox);

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
