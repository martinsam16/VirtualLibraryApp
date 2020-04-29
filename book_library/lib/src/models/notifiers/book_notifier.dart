import 'package:book_library/src/models/book.dart';
import 'package:flutter/widgets.dart';
import 'package:book_library/src/clients/book_service.dart';

class BookNotifier extends ChangeNotifier {
  List<Book> _books;
  List<Book> get books => _books;
  set books(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  int _selectedIndex;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    print(_selectedIndex);
    notifyListeners();
  }

  BookNotifier() {
    _books = initialBooks;
    var bs = BookService();
    bs.obtenerBooks().then((r) {
      _books..addAll(r);
      notifyListeners();
    }).catchError((err) {
      print(err.toString());
    });
    _selectedIndex = 0;
  }

  int _counter = 0;

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
