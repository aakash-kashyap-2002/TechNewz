import 'package:flutter/material.dart';
import 'package:technews/backend/functions.dart';
import 'package:technews/components/appbar.dart';
import 'package:technews/components/newsbox.dart';
import 'package:technews/components/searchbar.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const appbar(),
      body: Column(
        children: [
          const Searchbar(),
          Expanded(
            child: Container(
              width: width,
              child: FutureBuilder<List>(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                            title: snapshot.data![index]['title'],
                            description: snapshot.data![index]['description'].toString(),
                            time: snapshot.data![index]['publishedAt'],
                            imageurl: snapshot.data![index]['urlToImage'] ?? Constants.imageurl ,
                            url: snapshot.data![index]['url'],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    // By default, show a loading spinner.
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
