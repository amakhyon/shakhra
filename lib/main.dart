import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Sha5ra',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<String> _imagePaths = [
    "assets/images/open1.png",
    "assets/images/open2.png",
    "assets/images/open3.png",
    "assets/images/open4.png",
    "assets/images/open5.png",
    "assets/images/open6.png",
    "assets/images/open7.png",
    "assets/images/open8.png",
    "assets/images/open9.png",
    "assets/images/open10.png",
  ];
  //_imagePaths[_currentIndex];
  String closed_mouth = "assets/images/closed5.png";
  AudioPlayer _audioPlayer = AudioPlayer();

  String current_image = "assets/images/closed5.png";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

void  _playSound()  {
        // _audioPlayer.setSource(AssetSource());
       _audioPlayer.play(AssetSource('sound/shakhra.mp3'));
  }


  void _closeMouth(){
    setState((){
      current_image = "assets/images/closed5.png";
    });
    _audioPlayer.stop();
  }
  void _openMouth(){
    setState((){
      _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      current_image = _imagePaths[_currentIndex];
    });
    _playSound();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: GestureDetector(
        onTapDown:(details){
          _openMouth();
          },
        onTapUp: (details){
          _closeMouth();
        },
        onTapCancel: (){
          _closeMouth();
        },

        child: Center(
          child: Image.asset(current_image),
        ),
      ),
    );
  }
}