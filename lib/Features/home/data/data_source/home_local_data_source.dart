import 'package:bookly/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageIndex = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageIndex = 0}) {
    int startIndex = pageIndex * 10;
    int endIndex = (pageIndex + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    var length = box.values.length;
    if (endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
