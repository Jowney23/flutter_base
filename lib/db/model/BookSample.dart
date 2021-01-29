//
final String tableBook = 'book';
final String columnId = '_id';
final String columnName = 'name';
final String columnAuthor = 'author';
final String columnPrice = 'price';
final String columnPublishingHouse = 'publishingHouse';

class Book {
  int id;
  String name;
  String author;
  double price;
  String publishingHouse;
  Book();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnAuthor: author,
      columnPrice: price,
      columnPublishingHouse: publishingHouse
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }


  Book.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    author = map[columnAuthor];
    price = map[columnPrice];
    publishingHouse = map[columnPublishingHouse];
  }
}
