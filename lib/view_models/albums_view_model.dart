import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:pixel_apps_assignment/models/albums.dart';
import 'package:pixel_apps_assignment/models/api_response.dart';
import 'package:pixel_apps_assignment/repositories/album_repository.dart';
import 'package:rxdart/rxdart.dart';

class AlbumViewModel extends ChangeNotifier {
  AlbumViewModel() {
    toggleFavoriteAlbum(null);
    fetchAlbumData();
  }

  Stream<ApiResponse> get response {
    return _apiResponse.stream;
  }

  Stream<Album?> get selectedAlbum {
    return _selectedAlbum.stream;
  }

  Stream<Albums?> get favoriteAlbums {
    return _favoriteAlbums.stream;
  }

  int index = 0;
  final AlbumsRepository albumsRepository = AlbumsRepository();
  final _apiResponse =
      BehaviorSubject<ApiResponse>.seeded(ApiResponse.initial('Empty data'));
  final _selectedAlbum = BehaviorSubject<Album>();
  final _favoriteAlbums = BehaviorSubject<Albums>();

  Future<void> fetchAlbumData() async {
    _apiResponse.add(ApiResponse.loading('Fetching artist data'));
    try {
      Albums? albumList = await albumsRepository.fetchJackJohnson();
      _apiResponse.add(ApiResponse.completed(albumList));
    } catch (e) {
      _apiResponse.add(ApiResponse.error(e.toString()));
      log(e.toString());
    }
  }

  void setSelectedAlbum(Album? album) {
    _selectedAlbum.add(album!);
  }

  void toggleFavoriteAlbum(Album? album) async {
    final albums = await albumsRepository.toggleFavoriteAlbum(album);
    _favoriteAlbums.add(albums);
    notifyListeners();
  }

  bool checkFavoriteAlbum(Album? album) =>
      _favoriteAlbums.stream.hasValue &&
      _favoriteAlbums.stream.value.results!.contains(album);

  void setSelectedIndex(int value) {
    index = value;
    notifyListeners();
  }

  @override
  dispose() {
    _apiResponse.close();
    _selectedAlbum.close();
    _favoriteAlbums.close();
    super.dispose();
  }
}
