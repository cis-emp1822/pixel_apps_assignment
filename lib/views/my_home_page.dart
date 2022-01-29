import 'package:flutter/material.dart';
import 'package:pixel_apps_assignment/models/albums.dart';
import 'package:pixel_apps_assignment/models/api_response.dart';
import 'package:pixel_apps_assignment/view_models/albums_view_model.dart';
import 'package:pixel_apps_assignment/views/tabs/all_songs_widget.dart';
import 'package:pixel_apps_assignment/views/tabs/favorite_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AlbumViewModel viewModel = Provider.of<AlbumViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Center(child: Builder(builder: (context) {
          switch (viewModel.index) {
            case 0:
              return StreamBuilder<ApiResponse?>(
                  stream: viewModel.response,
                  builder: (context, snapshot) => AllSongsWidget(
                        apiResponse: snapshot.data,
                      ));
            case 1:
              return StreamBuilder<Albums?>(
                  stream: viewModel.favoriteAlbums,
                  builder: (context, snapshot) => FavoriteWidget(
                        albums: snapshot.data,
                      ));
            default:
              return const SizedBox(
                height: 0,
              );
          }
        })),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.index,
          onTap: viewModel.setSelectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.queue_music,
                  size: 28,
                ),
                icon: Icon(
                  Icons.queue_music,
                  size: 18,
                ),
                label: 'all songs'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  size: 28,
                ),
                icon: Icon(
                  Icons.favorite,
                  size: 18,
                ),
                label: 'favorite songs'),
          ],
        ));
  }
}
