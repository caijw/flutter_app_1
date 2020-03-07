// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  if (!kIsWeb && (Platform.isLinux || Platform.isWindows)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(new MyApp());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
          onTap: () {
            print('onTap');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


// Flutter code sample for Listener

// This example makes a [Container] react to being touched, showing a count of
// the number of pointer downs and ups.

// import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';

// void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementDown(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _downCounter++;
    });
  }

  void _incrementUp(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _upCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  void onPointerCancel(PointerEvent details) {
    print('onPointerCancel' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    print(details);
  }

  void onPointerDown(PointerEvent details) {
    print('onPointerDown' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    print(details);
  }

  void onPointerEnter(PointerEvent details) {
    print('onPointerEnter' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    print(details);
  }

  void onPointerExit(PointerEvent details) {
    print('onPointerExit' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    print(details);
  }

  void onPointerHover (PointerEvent details) {
    // print('onPointerHover' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    // print(details);
  }

  void onPointerMove (PointerEvent details) {
    print('onPointerMove' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    print(details);
  }

  void onPointerSignal (PointerEvent details) {
    print('onPointerSignal' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    print(details);
  }

  void onPointerUp (PointerEvent details) {
    print('onPointerUp' + ' ' + (new DateTime.now().millisecondsSinceEpoch).toString());
    print(details);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(Size(1000.0, 800.0)),
      child: Listener(
        onPointerCancel: onPointerCancel,
        onPointerDown: onPointerDown,
        onPointerEnter: onPointerEnter,
        onPointerExit: onPointerExit,
        onPointerHover: onPointerHover,
        onPointerMove: onPointerMove,
        onPointerSignal: onPointerSignal,
        onPointerUp: onPointerUp,
        child: Container(
          color: Colors.lightBlueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'You have pressed or released in this area this many times:'),
              Text(
                '$_downCounter presses\n$_upCounter releases',
                style: Theme.of(context).textTheme.display1,
              ),
              Text(
                'The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
