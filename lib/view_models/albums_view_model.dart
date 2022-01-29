import 'dart:developer';
import 'package:pixel_apps_assignment/models/albums.dart';
import 'package:pixel_apps_assignment/models/api_response.dart';
import 'package:rxdart/rxdart.dart';

class AlbumViewModel {
  ApiResponse get response {
    return _apiResponse.value;
  }

  Album? get selectedAlbum {
    return _selectedAlbum.valueOrNull;
  }

  Albums? get favoriteAlbums {
    return _favoriteAlbums.valueOrNull;
  }

  final _apiResponse =
      BehaviorSubject<ApiResponse>.seeded(ApiResponse.initial('Empty data'));
  final _selectedAlbum = BehaviorSubject<Album>();
  final _favoriteAlbums = BehaviorSubject<Albums>();
  Future<void> fetchMediaData() async {
    _apiResponse.add(ApiResponse.loading('Fetching artist data'));
    try {
      Albums? albumList;
      _apiResponse.add(ApiResponse.completed(albumList));
    } catch (e) {
      _apiResponse.add(ApiResponse.error(e.toString()));
      log(e.toString());
    }
  }

  void setSelectedMedia(Album? album) {
    _selectedAlbum.add(album!);
  }

  dispose() {
    _apiResponse.close();
    _selectedAlbum.close();
    _favoriteAlbums.close();
  }
}
