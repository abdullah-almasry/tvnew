import 'package:chillyflix/Tabs/FaceBook.dart';
import 'package:chillyflix/Tabs/Radio.dart';
import 'package:chillyflix/Tabs/Youtube.dart';
import 'package:chillyflix/utils/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 40, 50),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Norway Voice TV"),
          ],
        ),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 200,
              child: RaisedButton(
                color: Colors.red,
                focusNode: FocusNode(
                  canRequestFocus: false,
                ),
                focusColor: Colors.amber,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Youtube(),)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.rss_feed,size: 90,color: Colors.white,),
                      Icon(FontAwesomeIcons.youtubeSquare,color: Colors.white,size: 80,),
                      Text('مشاهده البث',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white,),),
                      Text("اضغط هنا",style: TextStyle(color: Colors.white,),),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 200,
              child: RaisedButton(
                color: Colors.blue,
                focusNode: FocusNode(
                  canRequestFocus: false,
                ),
                focusColor: Colors.amber,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>FaceBook(),)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.rss_feed,size: 90,color: Colors.white,),
                      Icon(FontAwesomeIcons.tv,color: Colors.white,size: 80,),
                      Text('مشاهده البث',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white,),),
                      Text("اضغط هنا",style: TextStyle(color: Colors.white,),),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 200,
              child: RaisedButton(
                color: Colors.white10,
                focusNode: FocusNode(
                  canRequestFocus: false,
                ),
                focusColor: Colors.amber,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>RadioAudio(),)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.rss_feed,size: 90,color: Colors.white,),
                      Icon(Icons.radio,color: Colors.white,size: 80,),
                      Text('سماع الراديو',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white,),),
                      Text("اضغط هنا",style: TextStyle(color: Colors.white,),),
                    ]),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

/*
import 'package:chillyflix/Tabs/Youtube.dart';
import 'package:chillyflix/Tabs/Radio.dart';
import 'package:chillyflix/Tabs/FaceBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {


  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 35, 40, 50),

          body: Column(
            children: <Widget>[
              Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Row(
                children: <Widget>[
                  Text(widget.title),
                  TabBar(
                    isScrollable: false,
                    indicatorColor: Color.fromARGB(255, 255, 60, 70),
                    tabs: <Widget>[
                      Tab(text: 'Youtube'),
                      Tab(text: 'FaceBook'),
                      Tab(text: 'Radio'),
                    ],
                  )
                ],
              ),
            ),
              Expanded(
                flex: 4,
                child: Center(
                  child: TabBarView(
                    children: <Widget>[
                      Youtube(),
                      FaceBook(),
                      ShowsTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
*/
