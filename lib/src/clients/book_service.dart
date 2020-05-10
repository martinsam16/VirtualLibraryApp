import 'dart:async';
import 'dart:convert';
import 'package:book_library/src/models/book.dart';
import 'package:http/http.dart';

class BookService {
  final String baseUrl = 'http://70.37.49.250:8081';
  Future<List<Book>> obtenerBooks() async {
    String url = '$baseUrl/book/search';
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
      List<Book> books = body
          .map(
            (dynamic item) => Book.fromJson(item),
          )
          .toList();

      return books;
    } else {
      return null;
    }
  }

}
