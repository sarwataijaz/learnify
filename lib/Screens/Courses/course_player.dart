import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Colors/colors.dart';
import 'package:video_player/video_player.dart';

class CoursePlayer extends StatefulWidget {

  final String courseTitle;
  final String courseAsset;

  const CoursePlayer({super.key, required this.courseTitle, required this.courseAsset});

  @override
  State<CoursePlayer> createState() => _CoursePlayerState();
}

class _CoursePlayerState extends State<CoursePlayer> {
  late VideoPlayerController _controller;
  bool _showIcon = false;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(widget.courseAsset);

     _controller.initialize().then((_) {
      setState(() {
        _showIcon = true;
      });
    });

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.background,
        title: Text(
          widget.courseTitle,
          style: GoogleFonts.lato(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: (_controller.value.isInitialized)
                  ? _videoPlayer()
                  : _loading()),
          SizedBox(
            height: 10,
          ),
          (_showIcon)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                     Icons.replay_10_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      backgroundColor: Colors.white,
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: AppColors.primaryGreen,
                        size: 50,
                      ),
                    ),
                    Icon(
                      Icons.forward_10_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _loading() {
    setState(() {
      _showIcon = false;
    });
    return CircularProgressIndicator();
  }

  Widget _videoPlayer() {
    setState(() {
      _showIcon = true;
    });
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio * 0.8,
      child: VideoPlayer(_controller,),
    );
  }
}
