import 'package:flutter/material.dart';

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
  int _coins = 0;

  String _topButton = "assets/top-button-no-shadow.png";
  String _bottomButton = "assets/bottom-button-no-shadow.png";

  void _handleIncrement() {
    setState(() {
      _topButton = "assets/top-button-pressed-no-shadow.png";
      _coins++;
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _topButton = "assets/top-button-no-shadow.png";
        });
      });
    });
  }

  void _handleDecrement() {
    setState(() {
      if (_coins > 0) {
        _coins--;
        _bottomButton = "assets/bottom-button-pressed-no-shadow.png";
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _bottomButton = "assets/bottom-button-no-shadow.png";
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF716F6B),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const Positioned.fill(
              top: 0.0,
              left: 0.0,
              child: Image(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.contain,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: _handleIncrement,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(_topButton))),
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    '$_coins',
                    style: const TextStyle(
                      color: Color(0xFF362917),
                      fontSize: 75,
                      fontFamily: "Klarissa"
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _handleDecrement,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(_bottomButton))),
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
