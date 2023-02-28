import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'SourceSansPro',
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'images/cauldron.png',
          ),
          title: const Text(
            'Ask me something',
          ),
        ),
        body: const MagicBall(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  var myText = 'What do you want to know?';
  var responses = [
    'My reply is no',
    'Don´t count on it',
    'My sources says no',
    'Very Doubtful',
    'Most Likely',
    'It´s Possible',
    'Without a doubt',
    'I don´t know'
  ];
  var imgList = ['happy', 'sad', 'thinking'];
  var imgEmo = 'happy';
  void getResponse() {
    var randomResponse = Random().nextInt(responses.length);
    var randomImage = Random().nextInt(imgList.length);
    setState(() {
      myText = responses[randomResponse];
      imgEmo = imgList[randomImage];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.asset('images/$imgEmo.png')),
          Text(
            '$myText',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Think a question, and hit the button',
                style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                getResponse();
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Consult the Oracle',
                  style: TextStyle(fontSize: 16),
                ),
              ))
        ]);
  }
}
