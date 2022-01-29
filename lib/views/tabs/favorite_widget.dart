import 'package:flutter/material.dart';
import 'package:pixel_apps_assignment/models/albums.dart';
import 'package:pixel_apps_assignment/views/widgets/album_holder.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({Key? key, this.albums}) : super(key: key);
  final Albums? albums;
  @override
  Widget build(BuildContext context) {
    if (albums == null) {
      return const SizedBox(
        height: 0,
      );
    }
    switch (albums?.resultCount == 0) {
      case true:
        return const Center(
          child: Text("No Favorites Added"),
        );
      case false:
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: albums?.resultCount,
            itemBuilder: (context, index) =>
                AlbumHolder(album: albums!.results![index]));
      default:
        return Container();
    }
  }
}
