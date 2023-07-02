import 'package:flutter/material.dart';
import 'package:my_api/api/my_api.dart';
import 'package:my_api/models/my_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<MainModel>? response;

  @override
  void initState() {
    response = getRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Book:",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                FutureBuilder(
                  future: response,
                  builder: (BuildContext context,
                      AsyncSnapshot<MainModel> snapshot) {
                    if (!(snapshot.hasData)) {
                      return const CircularProgressIndicator(
                        color: Colors.red,
                      );
                    }
                    return response == null
                        ? const Center(
                            child: Text(
                              "Error..cant load",
                            ),
                          )
                        : Center(
                            child: Container(
                              height: 400.0,
                              width: 400.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                "publish data:${snapshot.data!.records.bookInfo.publishDates[0]}\nTitle:${snapshot.data!.records.bookInfo.data.title}\nAuthor:${snapshot.data!.records.bookInfo.data.authors[0].name}\nNumber_of_page:${snapshot.data!.records.bookInfo.data.numberOfPages}\nPublish_place:${snapshot.data!.records.bookInfo.data.publishPlaces[0].name}\nPublish_date:${snapshot.data!.records.bookInfo.data.publishDate}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
