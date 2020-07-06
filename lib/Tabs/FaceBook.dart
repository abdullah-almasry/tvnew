import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:native_video_view/native_video_view.dart';

import 'package:edge_alert/edge_alert.dart';

class FaceBook extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<FaceBook> {
  String _videoId;

  String _errMsg;
  String _streamUrl;

  void _startFacebookVideo(String url) async {
    var response = await Dio().get<String>(url);
    var data = response.data;
    var metas = parse(data).head.querySelectorAll('meta');
    String videoUrl;
    for (var element in metas) {
      if (element.attributes['property'] == 'og:video') {
        videoUrl = element.attributes['content'];
        break;
      }
    }
    if (videoUrl == null) {
      EdgeAlert.show(context,
          title: 'هناك مشكله سوف نعمل على حلها', gravity: EdgeAlert.TOP);
      _errMsg = 'تاكد من الاتصال بالانترنت';
    } else {
      setState(() {
        _streamUrl = videoUrl;
      });
    }
  }

  @override
  void initState() {
    FirebaseDatabase.instance
        .reference()
        .child('facebook')
        .once()
        .then((value) {
      setState(() {
        _videoId = value.value;
        print(_videoId);
        _startFacebookVideo(_videoId);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoId == null)
      return Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ));
    if (_errMsg != null) return Center(child: Text(_errMsg));
    if (_streamUrl == null)
      return Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ));
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: NativeVideoView(
              keepAspectRatio: true,
              autoHide: true,
              showMediaController: true,
              onCreated: (controller) {
                controller.setVideoSource(
                  _streamUrl,
                  sourceType: VideoSourceType.network,
                );
              },
              onPrepared: (controller, info) {
                controller.play();
              },
              onError: (controller, what, extra, message) {
                print('Player Error ($what | $extra | $message)');
              },
              onCompletion: (controller) {
                print('Video completed');
              },
              onProgress: (progress, duration) {
                print('$progress | $duration');
              },
            ),
          ),
        ),

    );
  }
}
