import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isReversed = false;
  List<UniqueKey> _incDecKeys = [UniqueKey(), UniqueKey()];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() => _counter--);
  }

  void _resetCounter() {
    setState(() => _counter = 0);
    setState(() => _isReversed = !_isReversed);
  }

  @override
  Widget build(BuildContext context) {
    final incBtn = FancyButton(
      key: _incDecKeys.first,
      onPressed: _incrementCounter,
      child: const Text(
        "Increment",
        style: TextStyle(color: Colors.white),
      ),
    );
    final decBtn = FancyButton(
      key: _incDecKeys.last,
      onPressed: _decrementCounter,
      child: const Text(
        "Decrement",
        style: TextStyle(color: Colors.white),
      ),
    );
    final incDecBtns = _isReversed ? [decBtn, incBtn] : [incBtn, decBtn];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.blue.withOpacity(0.25),
              ),
              child: Image.asset('images/flutter_logo.png', width: 100.0),
            ),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: incDecBtns),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({super.key, required this.onPressed, required this.child});

  @override
  State<FancyButton> createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _getColor()),
      onPressed: widget.onPressed,
      child: widget.child,
    ));
  }

  Color _getColor() {
    return _colors.putIfAbsent(this, () => colors[next(0, colors.length)]);
  }
}

Map<_FancyButtonState, Color> _colors = {};
final _random = Random();

int next(int min, int max) => min + _random.nextInt(max - min);
List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.indigo,
  Colors.cyan,
  Colors.amber,
  Colors.lime,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];
