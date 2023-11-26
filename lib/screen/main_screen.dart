import 'package:flutter/material.dart';
import 'package:melodify/screen/top_list/top_album.dart';
import 'package:melodify/screen/top_list/youtube_list.dart';
import 'package:melodify/widget/myappbar.dart';
import 'package:melodify/widget/mybottombar.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 5),
              height: 210,
              child: TopAlbum(cat: "kpop"),
            ), // Top Kpop
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 5),
              height: 250,
              child: TopAlbum(cat: "R&B"),
            ), //Top R&B
            Container(
                margin: EdgeInsets.only(top: 0, bottom: 20),
                height: 220,
                child: YoutubeList()) // YoutubeList
          ],
        ),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
