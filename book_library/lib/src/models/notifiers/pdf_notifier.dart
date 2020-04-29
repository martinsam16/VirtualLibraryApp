import 'package:book_library/src/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfNotifier {
  int start = 1;
  int end = 1;
  Book _book;

  PdfNotifier(Book b) {
    _book = b;
  }

  void sacarPdf() {
    _launchURL(
        'http://70.37.49.250:8081/book/pages/${_book.id}?start=$start&end=$end');
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puedeeeeeeeeeeee!! $url';
    }
  }
}
