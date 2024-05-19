import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioPlayerController extends GetxController {
  static AudioPlayer player = AudioPlayer();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await player.setSource(AssetSource('audios/1.mp3'));
    //   await player.resume();
    // });
  }

  static Future<void> play(String soundSource) async {
    await player.play(AssetSource(soundSource));
  }
}