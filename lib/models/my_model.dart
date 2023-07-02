class MainModel {
  final Records records;
  MainModel({required this.records});

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      records: Records.fromJson(
        json["records"],
      ),
    );
  }
}

//records
class Records {
  final BookInformation bookInfo;
  Records({required this.bookInfo});

  factory Records.fromJson(Map<String, dynamic> json) {
    return Records(
      bookInfo: BookInformation.fromJson(
        json["/books/OL2842220M"],
      ),
    );
  }
}

//book_info
class BookInformation {
  final List<dynamic> publishDates;
  final Data data;

  BookInformation({
    required this.data,
    required this.publishDates,
  });

  factory BookInformation.fromJson(Map<String, dynamic> json) {
    return BookInformation(
      data: Data.fromJson(json["data"]),
      publishDates: json["publishDates"],
    );
  }
}

//data
class Data {
  final String title;
  final List<Authors> authors;
  final int numberOfPages;
  final List<PublishPlace> publishPlaces;
  final String publishDate;

  Data({
    required this.title,
    required this.authors,
    required this.numberOfPages,
    required this.publishPlaces,
    required this.publishDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json["title"],
      authors: List<Authors>.from(
        json["authors"].map(
          (v) => Authors.fromJson(v),
        ),
      ),
      numberOfPages: json["number_of_pages"],
      publishPlaces: List<PublishPlace>.from(
        json["publish_places"].map(
          (v) => PublishPlace.fromJson(v),
        ),
      ),
      publishDate: json["publish_date"],
    );
  }
}

//publish_place
class PublishPlace {
  final String name;

  PublishPlace({
    required this.name,
  });

  factory PublishPlace.fromJson(Map<String, dynamic> json) {
    return PublishPlace(
      name: json["name"],
    );
  }
}

//authors
class Authors {
  final String name;

  Authors({required this.name});

  factory Authors.fromJson(Map<String, dynamic> json) {
    return Authors(
      name: json["name"],
    );
  }
}
