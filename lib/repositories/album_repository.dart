import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:pixel_apps_assignment/models/albums.dart';
import 'package:http/http.dart' as http;

import '../helpers/constants.dart';

class AlbumsRepository {
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
    final box = GetStorage();
    final Albums albums;
    if (box.read('albums') == null || box.read('albums') is! String) {
      albums = Albums(resultCount: 0, results: []);
    } else {
      albums = Albums.fromJson(jsonDecode(box.read('albums')));
    }
    if (album == null) return albums;
    if (albums.results!.contains(album)) {
      albums.results!.remove(album);
      albums.resultCount = albums.resultCount! - 1;
    } else {
      albums.results!.add(album);
      albums.resultCount = albums.resultCount! + 1;
    }
    await box.write('albums', jsonEncode(albums.toJson()));
    await box.save();
    return albums;
  }
}
