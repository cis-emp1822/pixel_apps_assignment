import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:pixel_apps_assignment/models/albums.dart';
import 'package:http/http.dart' as http;

import '../helpers/constants.dart';

class AlbumsRepository {
  final box = Hive.box('albumBox');

  Future<Albums?> fetchJackJohnson() async {
    final response = await http
        .get(Uri.parse("${Constant.baseUrl}/lookup?id=909253&entity=album"));

    if (response.statusCode == 200) {
      final decodedMap = jsonDecode(response.body);
      return Albums.fromJson(decodedMap);
    } else {
      throw Exception("Unable to fetch Albums");
    }
  }

  Future<Albums> toggleFavoriteAlbum(Album? album) async {
    final Albums albums =
        box.get('albums') ?? Albums(resultCount: 0, results: []);
    if (album == null) return albums;
    if (albums.results!.contains(album)) {
      albums.results!.remove(album);
      albums.resultCount = albums.resultCount! - 1;
    } else {
      albums.results!.add(album);
      albums.resultCount = albums.resultCount! + 1;
    }
    await box.put('albums', albums);
    await box.flush();
    return albums;
  }
}
