import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
//In this flutter code,i have stored 10 audio mp3 as assets (in the button format).
//When we click on anyone button the song will be played
//if  we clicked on 'STOP' button the audio play will be stop playing song
void main() => runApp(MusicApp());

class MusicApp extends StatelessWidget {
  @override
AudioPlayer player;

    void _playFile(int playNumber) async{
      final cache=AudioCache();
      player = await cache.play('note$playNumber.mp3'); // assign player here
    }

    void _stopFile() {
      player?.stop(); // stop the file like this
    }

    Expanded mySong({int songNumber ,String textValue}){
      return Expanded(
        child: FlatButton(

          color: Colors.white,
          onPressed: ()  {
            _playFile(songNumber);
          },
          child: Text('$textValue',
            style:TextStyle(
              color: Colors.teal,
              fontFamily: 'Pacifico',
              fontSize: 20.0,
            ),
          ),
        ),
      );

    }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body : SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              mySong(songNumber: 1,textValue: 'Bad Girl Friend'),
              mySong(songNumber: 2,textValue: 'CNCO-Little Mix'),
              mySong(songNumber: 3,textValue: 'Don\'t Say You Love ME'),
              mySong(songNumber: 4,textValue: 'DuaLipa'),
              mySong(songNumber: 5,textValue: 'Echame La Culpa'),
              mySong(songNumber: 6,textValue: 'All We Know'),
              mySong(songNumber: 7,textValue: 'It Ain\'t Me'),
              mySong(songNumber: 8,textValue: 'Touch-LittleMix'),
              mySong(songNumber: 9,textValue: 'Pretty Girls'),
              mySong(songNumber: 10,textValue: 'Girls'),


              FlatButton(

                color: Colors.white,
                onPressed: ()  {
                  _stopFile();

                },
                child: Text('Stop',
                  style:TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//await audioPlayer.setUrl('clicking.mp3'); // prepare the player with this audio but do not start playing
//await audioPlayer.setReleaseMode(ReleaseMode.STOP); // set release mode so that it never releases
//
//// on button click
//await audioPlayer.resume(); // quickly plays the sound, will not release
//
//// on exiting screen
//await audioPlayer.release(); // manually release when no longer needed


//AudioCache cache; // you have this
//AudioPlayer player; // create this
//
//What is that ? for? – Jalil May 29 '19 at 12:27
//?. is used to check null, so stop() will be called only if player != null.
//https://stackoverflow.com/questions/56360083/stop-audio-loop-audioplayers-package