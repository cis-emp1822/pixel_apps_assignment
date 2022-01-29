import 'package:flutter/material.dart';
import 'package:pixel_apps_assignment/view_models/albums_view_model.dart';
import 'package:pixel_apps_assignment/views/my_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AlbumViewModel>(
            create: (context) => AlbumViewModel(),
          )
        ],
        builder: (context, child) => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const MyHomePage(title: 'Albums by John Johnson'),
            ));
  }
}
