import 'package:flutter/material.dart';
import 'package:wormy_effect_button/wormy_effect_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: WormyEffectButton(
        initialOffset: Offset(MediaQuery.of(context).size.width - 60,
            MediaQuery.of(context).size.height - 60),
        onPressed: _incrementCounter,
        holdPosition: false,
        hideUnderlying: true,
        curve: Curves.fastLinearToSlowEaseIn,
        motionDelay: 250,
        children: [
          Container(
            width: 50,
            height: 50,
            child: const Icon(Icons.camera),
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          Container(
            width: 50,
            height: 50,
            child: const Icon(Icons.camera),
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
          Container(
            width: 50,
            height: 50,
            child: const Icon(Icons.camera),
            decoration: const BoxDecoration(
                color: Colors.orange, shape: BoxShape.circle),
          ),
          Container(
            width: 50,
            height: 50,
            child: const Icon(Icons.camera),
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
          ),
          Container(
            width: 50,
            height: 50,
            child: const Icon(Icons.camera),
            decoration: const BoxDecoration(
                color: Colors.purple, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
