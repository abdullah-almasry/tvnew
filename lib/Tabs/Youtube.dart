import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class Youtube extends StatefulWidget {

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  String _videoId ;
  @override
  void initState() {
    FirebaseDatabase.instance.reference().child('youtube').once().then((value) {
      setState(() {
        _videoId = value.value;
        print(_videoId);
      });


    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  return _videoId == null ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,)): Container(
        height: double.infinity,
        width: double.infinity,
        child: FlutterYoutubeView(

            scaleMode: YoutubeScaleMode.none, // <option> fitWidth, fitHeight
            params: YoutubeParam(
                videoId: _videoId,
                showUI: false,
                startSeconds: 0.0, // <option>
                autoPlay: true) // <option>
        )
    );

  }
}
