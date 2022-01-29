import 'package:flutter/material.dart';
import 'package:pixel_apps_assignment/models/albums.dart';
import 'package:pixel_apps_assignment/view_models/albums_view_model.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key, this.album}) : super(key: key);
  final Album? album;
  @override
  Widget build(BuildContext context) {
    AlbumViewModel viewModel = Provider.of<AlbumViewModel>(context);
    return TextButton(
        onPressed: () => viewModel.toggleFavoriteAlbum(album),
        child: Icon(
          viewModel.checkFavoriteAlbum(album!)
              ? Icons.favorite
              : Icons.favorite_border,
          color: Colors.redAccent,
        ));
  }
}
