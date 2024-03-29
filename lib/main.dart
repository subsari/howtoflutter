import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:howtoflutter/about.dart';
import 'package:howtoflutter/firestore.dart';
import 'package:url_launcher/url_launcher.dart'; 

import 'resources.dart';

void main() => runApp(MyApp());

_launchUrlInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HowTo Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'HowTo Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Row(
            children: <Widget>[FlutterLogo(), Text('Flutter')],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Resources"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResourcesRoute()),
                );
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Example - FireStore"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleFireStore()));
              }
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutRoute()));
              }
            ),
          ],
        ),
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
                    Text('Vader Theme', style: TextStyle(fontSize: 40, color: Colors.white),),
                    Text(
                        'Quickly customize your flutter widget to match your design vision',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),),
                onTap: (){
                  _launchUrlInBrowser("https://github.com/kuafucode/vader/");
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
                    Text('Resources', style: TextStyle(fontSize: 40, color: Colors.white),),
                    Text(
                        'All the resources you need to be a successful Flutter developer!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),),
                onTap: (){
                  _launchUrlInBrowser("https://github.com/subsari/howtoflutter/");
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
} // _MyHomePageState
