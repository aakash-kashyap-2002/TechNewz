import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:technews/components/searchbar.dart';
import 'package:technews/utils/key.dart';

// Future<List> fetchnews() async {
//   final response = await http.get(
//     Uri.parse(
//       'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${Key.key}&q=${Searchbar.searchController.text}',
//     ),
//   );
//   Map result = jsonDecode(response.body);
//   print('fetched successfully!');
//   print(result['articles']);
//   return (result['articles']);
// }

Future<List> fetchnews() async {
  try {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=${Key.key}&q=${Searchbar.searchController.text}'),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map result = jsonDecode(response.body);
      print('Fetched');
      return (result['articles']);
    } else {
      // If the server returns a response other than 200 OK, throw an error.
      throw Exception('Failed to load news');
    }
  } on http.ClientException catch (e) {
    print('ClientException: $e');
    throw Exception('ClientException occurred');
  } on SocketException catch (e) {
    print('SocketException: $e');
    throw Exception('SocketException occurred');
  } catch (e) {
    print('Other Exception: $e');
    throw Exception('An unexpected error occurred');
  }
}
