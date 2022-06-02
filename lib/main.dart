import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        primarySwatch: Colors.yellow,
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
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage("assets/fond3.png"),
                fit: BoxFit.cover
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage("assets/logo-small.png"), width: 360),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Stack(
                      children: [
                        Positioned.fill(child: Image.asset("assets/Coin-background.png")),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              "$_coins",
                              style: const TextStyle(
                                color: Color(0xFF362917),
                                fontSize: 75,
                                fontFamily: "Klarissa",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 360,
                  height: 240,
                  child: Stack(
                    children: [
                      Positioned.fill(child: Image.asset('assets/Button-background.png'),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: _handleIncrement,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Container(
                                decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(_topButton))),
                                width: 90,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _handleDecrement,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 35),
                              child: Container(
                                decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(_bottomButton))),
                                width: 90,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                )
              ],
            )
          ]
        ),
      )
      
    );
  }
}


// Center(
//         child: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             const Positioned.fill(
//               top: 0.0,
//               left: 0.0,
//               child: Image(
//                 image: AssetImage('assets/fond3.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const Image(
//                   image: AssetImage('assets/logo-small.png'),
//                   width: 400,
//                 ),
//                 Expanded(
//                   child: Stack(
//                     children: [
//                     const Positioned.fill(
//                       top: 0.0,
//                       left: 0.0,
//                       child: Image(
//                         image: AssetImage('assets/background-2.png'),
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         GestureDetector(
//                           onTap: _handleIncrement,
//                           child: AnimatedContainer(
//                             constraints: const BoxConstraints(maxWidth: 100, maxHeight: 100),
//                             duration: const Duration(milliseconds: 500),
//                             decoration: BoxDecoration(
//                             image: DecorationImage(image: AssetImage(_topButton))),
//                             width: screenWidth * 0.15,
//                             height: screenWidth * 0.15,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 50, bottom: 50),
//                           child: Text(
//                             '$_coins',
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               color: Color(0xFF362917),
//                               fontSize: 75,
//                               fontFamily: "Klarissa",
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: _handleDecrement,
//                           child: AnimatedContainer(
//                             constraints: const BoxConstraints(maxWidth: 100, maxHeight: 100),
//                             duration: const Duration(milliseconds: 500),
//                             decoration: BoxDecoration(
//                             image: DecorationImage(image: AssetImage(_bottomButton))),
//                             width: screenWidth * 0.15,
//                             height: screenWidth * 0.15,
//                           ),
//                         ),
//                       ],
//                     )],
//                   ),
//                 ),
//                 Container(
//                   height: 146.9
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),