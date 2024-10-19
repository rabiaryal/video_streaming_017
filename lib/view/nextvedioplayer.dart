import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HorizontalVideoPlayer extends StatefulWidget {
  final List<String> videoUrls;

  const HorizontalVideoPlayer({Key? key, required this.videoUrls}) : super(key: key);

  @override
  _HorizontalVideoPlayerState createState() => _HorizontalVideoPlayerState();
}

class _HorizontalVideoPlayerState extends State<HorizontalVideoPlayer> {
  PageController _pageController = PageController();
  List<VideoPlayerController> _videoControllers = [];
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    // Initialize VideoPlayerControllers for each video URL
    for (var url in widget.videoUrls) {
      _videoControllers.add(VideoPlayerController.network(url)
        ..initialize().then((_) {
          setState(() {}); // Refresh UI when each video is initialized
        }));
    }
    // Start playing the first video
    _videoControllers[0].play();
  }

  @override
  void dispose() {
    // Dispose all VideoPlayerControllers
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horizontal Video Player")),
      body: PageView.builder(
        scrollDirection: Axis.horizontal, // For horizontal scrolling
        controller: _pageController,
        itemCount: _videoControllers.length,
        onPageChanged: (index) {
          // Pause the previous video and play the new one
          for (int i = 0; i < _videoControllers.length; i++) {
            if (i == index) {
              _videoControllers[i].play(); // Play current video
            } else {
              _videoControllers[i].pause(); // Pause other videos
            }
          }
        },
        itemBuilder: (context, index) {
          final controller = _videoControllers[index];

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Ensure the video player takes up the full screen
              controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    )
                  : const Center(child: CircularProgressIndicator()),

              // Video controls (Play, Pause, Forward, Backward)
              _buildControlsOverlay(controller),

              // Video progress indicator
              VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.red,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildControlsOverlay(VideoPlayerController controller) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Backward button
              IconButton(
                icon: const Icon(Icons.replay_10, size: 40, color: Colors.white),
                onPressed: () {
                  controller.seekTo(controller.value.position - const Duration(seconds: 10));
                },
              ),
              // Play/Pause button
              IconButton(
                icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  });
                },
              ),
              // Forward button
              IconButton(
                icon: const Icon(Icons.forward_10, size: 40, color: Colors.white),
                onPressed: () {
                  controller.seekTo(controller.value.position + const Duration(seconds: 10));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}


