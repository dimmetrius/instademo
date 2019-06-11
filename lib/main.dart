import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instabug Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Instabug Demo'),
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
  static const MethodChannel platform = const MethodChannel('instabug_channel');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            platform.invokeMethod('show');
          },
          child: new Container(
            margin: EdgeInsets.all(20.0),
            child: Text('RUN', style: TextStyle(color: Colors.white),),
            height: 60.0,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(
                const Radius.circular(5.0),
              ),
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
