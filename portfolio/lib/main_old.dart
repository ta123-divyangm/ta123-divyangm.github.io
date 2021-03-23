import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divyang\'s Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Divyang\'s Portfolio Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/istockphoto-1058045964-612x612.jpg'),
              fit: BoxFit.cover),
        ),
        // Image.asset('/image/istockphoto-1058045964-612x612.jpg')
        child: Column(
          // shrinkWrap: true,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimatedTextKit(
              repeatForever: true,
              onTap: () {
                print("Tap Event");
              },
              text: [
                "My life in FLUTTER",
                "My life in REACT",
                "My life in NODE",
                "My life in ANGULAR"
              ],
              textStyle: TextStyle(fontSize: 40.0, fontFamily: "Horizon"),
            ),
          ],
        ),
      ),
    );
  }
}
