/**
 * Created by Anil Sharma on 16-02-2020
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'MethodChannel Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Click on FloatingActionButton and get Documents suing MethodChannel. Check Documents in'
                ' Logcat(search "Document")',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDocuments,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _getDocuments() async {
    MethodChannel _methodChannel = MethodChannel('flutter/MethodChannelDemo');
    List<dynamic> documentList = [""];
    try {
      documentList = await _methodChannel.invokeMethod("Documents");
    } on PlatformException catch (e) {
      print("exceptiong");
    }
    documentList.forEach((document) {
      print("Document: $document");
    });
  }
}
