import 'package:chillyflix/utils/controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';


const kUrl1 = 'http://104.194.9.150:9302/;';

final List<String> urls = [kUrl1, ];



class RadioAudio extends StatefulWidget {

  @override
  _RadioAudioState createState() => _RadioAudioState();
}

class _RadioAudioState extends State<RadioAudio> {
  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget remoteUrl() {
    return SingleChildScrollView(
      child: _tab([

        PlayerWidget(url: kUrl1),

        Text(
          "from: NorWay Voice Radio",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ]),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        bottomOpacity: 1.0,
        title: Text('اذاعه راديو صوت النرويج'),
      ),
      body: Container(
        child:
        remoteUrl(),


      ),
    );
  }
}