import 'package:flutter/material.dart';
import 'package:video_streaming_bloc_017/view/nextvedioplayer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of video URLs
    final videoUrls = [
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ];

    return HorizontalVideoPlayer(videoUrls: videoUrls);
  }
}
