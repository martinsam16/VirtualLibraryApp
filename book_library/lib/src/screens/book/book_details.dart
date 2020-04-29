import 'package:book_library/src/models/notifiers/pdf_notifier.dart';
import 'package:book_library/src/style.dart';
import 'package:book_library/src/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:book_library/src/models/book.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class BookDetails extends StatelessWidget {
  final Book _book;

  BookDetails(Book book) : _book = book;

  @override
  Widget build(BuildContext context) {
    PdfNotifier pdf = PdfNotifier(_book);
    return Scaffold(
      appBar: MediaQuery.of(context).size.width < wideLayoutThreshold
          ? _buildAppBar(context)
          : null,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: BookCover(
                  url: _book.bookCover,
                  boxFit: BoxFit.fitHeight,
                  height: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 4.0),
                child: Text(
                  '${_book.title}',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Por ',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: '${_book.author}',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      TextSpan(
                        text: ' en ',
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: '${_book.category}',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                '${_book.isbn}',
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                '${_book.numberPages} pág.',
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Text(
                '${_book.sizeReadable}',
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 38.0,
              ),
              Text(
                '${_book.description}',
                style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .caption
                        .color
                        .withOpacity(0.85),
                    fontFamily: 'Nunito',
                    fontSize: 16.0),
              ),
              frs.RangeSlider(
                min: 1.0,
                max: _book.numberPages.toDouble(),
                lowerValue: 1.0,
                upperValue: _book.numberPages.toDouble(),
                divisions: _book.numberPages,
                showValueIndicator: true,
                valueIndicatorMaxDecimals: 0,
                onChanged: (double newLowerValue, double newUpperValue) {},
                onChangeStart:
                    (double startLowerValue, double startUpperValue) {
                  pdf.start = startLowerValue.toInt();
                  pdf.end = startUpperValue.toInt();
                  print('inicio ${pdf.start} fin ${pdf.end}');
                },
                onChangeEnd: (double newLowerValue, double newUpperValue) {
                  pdf.start = newLowerValue.toInt();
                  pdf.end = newUpperValue.toInt();
                  //print('Ended with values: $newLowerValue and $newUpperValue');
                },
              ),
              Center(
                child: RaisedButton(
                  onPressed: () => {pdf.sacarPdf()},
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.file_download),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Detalles'),
    );
  }
}
