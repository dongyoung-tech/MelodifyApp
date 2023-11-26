import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeList extends StatefulWidget {
  const YoutubeList({super.key});

  @override
  State<YoutubeList> createState() => _YoutubeListState();
}

class _YoutubeListState extends State<YoutubeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            width: double.infinity,
            child: Text(
              "인기 아티스트 동영상",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
          height: 170,
          child: ListView.builder(
              scrollDirection: Axis.horizontal, // 수평 스크롤을 위한 설정
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 20,left: 5),
                  child:YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: 'w1b7YfgXJzQ', // 실제 YouTube 비디오 ID로 대체
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                        showLiveFullscreenButton: true
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    width: 320,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );;
  }
}
