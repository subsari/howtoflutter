import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_launchUrlInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class ResourcesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resources"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                child: InkWell(child: Padding(padding: EdgeInsets.all(20), child: Column(
                  children: <Widget>[
                    Text('Flutter by Example', style: TextStyle(fontSize: 40, color: Colors.white),),
                    Text(
                        'Collection of example tutorials that will help you master Flutter by coding real apps.',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),),
                onTap: (){
                  _launchUrlInBrowser("https://flutterbyexample.com/");
                },),
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/vaderrrr.png', scale: 0.02),
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                child: InkWell(child: Padding(padding: EdgeInsets.all(20), child: Column(
                  children: <Widget>[
                    Text('Flutter DEV', style: TextStyle(fontSize: 40, color: Colors.white),),
                    Text(
                        'The flutter community all in one place. This is the place you probably used to learn about the hackathon!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),),
                onTap: (){
                  _launchUrlInBrowser("https://flutter.dev/");
                },),
                decoration: BoxDecoration(
                  color: const Color(0xff7c94a6),
                ),
              ),
            ),
            Card(
              child: Container(
                child: InkWell(child: Padding(padding: EdgeInsets.all(20), child: Column(
                  children: <Widget>[
                    Text('Animations', style: TextStyle(fontSize: 40, color: Colors.white),),
                    Text(
                        'A quick guide to learn how to animation your Flutter app!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),),
                onTap: (){
                  _launchUrlInBrowser("https://medium.com/flutter-community/flutter-animation-has-never-been-easier-part-1-e378e82b2508");
                },),
                decoration: BoxDecoration(
                  color: const Color(0xff7c94a6),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
