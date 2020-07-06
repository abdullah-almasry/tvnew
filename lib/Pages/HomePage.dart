
import 'package:chillyflix/Tabs/FaceBook.dart';
import 'package:chillyflix/Tabs/Radio.dart';
import 'package:chillyflix/Tabs/Youtube.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 40, 50),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Norway Voice TV"),
              SizedBox(width: 50),
              TabBar(
                isScrollable: true,
                indicatorColor: Color.fromARGB(255, 255, 60, 70),
                tabs: <Widget>[
                  Tab(text: 'Youtube'),

                  Tab(text: 'Radio'),
                  Tab(text: 'FaceBook'),
                ],
              )
            ],
          ),

        ),
        body: Center(
          child: TabBarView(
            children: <Widget>[
              Youtube(),

              RadioAudio(),
              FaceBook(),
            ],
          ),
        ),
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
