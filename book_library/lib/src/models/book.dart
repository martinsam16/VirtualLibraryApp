class Book {
  String id;
  String isbn;
  String title;
  String author;
  String description;
  String bookCover;
  String category;
  num numberPages;
  String sizeReadable;

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    isbn = json['isbn'] as String;
    title = json['title'] as String;
    author = json['author'] as String;
    description = json['description'] as String;
    bookCover = json['bookCover'] as String;
    category = json['category'] as String;
    numberPages = json['numberPages'] as num;
    sizeReadable = json['sizeReadable'] as String;
  }
}

List<Book> initialBooks = [];
