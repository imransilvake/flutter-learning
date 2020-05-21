import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

/// audio player handler
void audioPlayerHandler(AudioPlayerState value) => print('state => $value');

class XylophoneApp extends StatelessWidget {
  /// play sound
  void playSound(int soundNumber) {
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.monitorNotificationStateChanges(audioPlayerHandler);
    AudioCache audioCache = AudioCache();
    audioCache.play('note$soundNumber.wav');
  }

  /// add sound
  Expanded addSound({Color color, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              addSound(color: Colors.red, soundNumber: 1),
              addSound(color: Colors.orange, soundNumber: 2),
              addSound(color: Colors.yellow, soundNumber: 3),
              addSound(color: Colors.green, soundNumber: 4),
              addSound(color: Colors.teal, soundNumber: 5),
              addSound(color: Colors.blue, soundNumber: 6),
              addSound(color: Colors.purple, soundNumber: 7)
            ],
          ),
        ),
      ),
    );
  }
}
