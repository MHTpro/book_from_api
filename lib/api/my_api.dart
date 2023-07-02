import 'dart:convert';

import 'package:http/http.dart' as httpmethod;
import 'package:my_api/models/my_model.dart';

Future<MainModel> getRequest() async {
  final response = await httpmethod.get(
    Uri.https(
      "openlibrary.org",
      "/api/volumes/brief/isbn/9780525440987.json",
    ),
  );

  if (response.statusCode == 200) {
    return MainModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception("Error:Can't load data");
  }
}
