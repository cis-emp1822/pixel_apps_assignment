import 'package:flutter/material.dart';
import 'package:pixel_apps_assignment/models/api_response.dart';
import 'package:pixel_apps_assignment/views/tabs/favorite_widget.dart';

class AllSongsWidget extends StatelessWidget {
  const AllSongsWidget({Key? key, this.apiResponse}) : super(key: key);
  final ApiResponse? apiResponse;
  @override
  Widget build(BuildContext context) {
    if (apiResponse == null) {
      return const SizedBox(
        height: 0,
      );
    }
    switch (apiResponse!.status) {
      case Status.initial:
        return Text(apiResponse!.message!);
      case Status.loading:
        return const CircularProgressIndicator();
      case Status.completed:
        return FavoriteWidget(albums: apiResponse!.data);
      case Status.error:
        return Text(apiResponse!.message!);
    }
  }
}
