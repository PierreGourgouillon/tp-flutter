import 'package:flutter/material.dart';
import 'package:tp_flutter/ManagerPlayer.dart';
import 'package:tp_flutter/music.dart';

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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Dis Heure'),
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
  late final ManagerPlayer manageMusic;
  late Music currentMusic;
  late String musicDuration;

  @override
  void initState() {
    super.initState();
    manageMusic = ManagerPlayer();
    currentMusic = manageMusic.currentMusic;
    manageMusic.initAudioMusic();
  }

  void nextMusic() {
    setState(() {
      currentMusic = manageMusic.nextMusic();
      manageMusic.initAudioMusic();
    });
  }

  void lastMusic() {
    setState(() {
      currentMusic = manageMusic.lastMusic();
      manageMusic.initAudioMusic();
    });
  }

  void resumeMusic() {
    setState(() {
      manageMusic.resumeMusic();
    });
  }

  void pauseMusic() {
    setState(() {
      manageMusic.pauseMusic();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      currentMusic.imagePath,
                      height: 400,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(currentMusic.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
                Container(
                  height: 5,
                ),
                Text(currentMusic.singer, style: const TextStyle(fontSize: 15)),
                Container(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: lastMusic,
                        icon: const Icon(Icons.skip_previous_rounded)),
                    manageMusic.isPlaying
                        ? IconButton(
                            onPressed: pauseMusic,
                            icon: const Icon(Icons.pause_rounded))
                        : IconButton(
                            onPressed: resumeMusic,
                            icon: const Icon(Icons.play_arrow_rounded)),
                    IconButton(
                        onPressed: nextMusic,
                        icon: const Icon(Icons.skip_next_rounded)),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Text(""),
              ]),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
