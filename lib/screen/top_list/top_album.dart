import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopAlbum extends StatefulWidget {
  final String cat;

  TopAlbum({Key? key, required this.cat}) : super(key: key);

  @override
  State<TopAlbum> createState() => _TopAlbumState();
}

class _TopAlbumState extends State<TopAlbum> {
  List<dynamic> topAlbumInfo = [];

  @override
  void initState() {
    super.initState();
    // initState에서 데이터 가져오기
    getAlbumInfo();
  }

  Future<void> getAlbumInfo() async {
    String apiUrl =
        'https://port-0-melodifyserver-1drvf2llollu2op.sel5.cloudtype.app/music/top-album?cat=${widget.cat}';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (mounted) {
        // 현재 위젯이 마운트되어 있는지 확인
        if (response.statusCode == 200) {
          // API 응답이 성공한 경우 JSON 데이터를 처리
          final decodedData = json.decode(response.body);
          setState(() {
            topAlbumInfo = decodedData['albums']['album'];
          });
        } else {
          // API 응답이 실패한 경우 에러 메시지를 출력
          print('Failed to load album data');
        }
      }
    } catch (error) {
      // 네트워크 오류 등 예외가 발생한 경우 에러 메시지를 출력
      if (mounted) {
        print('Error: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5, right: 5 ,bottom: 10),
            width: double.infinity,
            child: Text(
              "Top ${widget.cat} 앨범",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            height: 170, // 원하는 높이로 지정
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topAlbumInfo.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 180,
                  child: Card(
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            topAlbumInfo[index]['image'][2]['#text'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 130.0,
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            width: double.infinity,
                            child: Text(
                              topAlbumInfo[index]['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
