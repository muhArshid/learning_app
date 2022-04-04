import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/utils/AppColorCode.dart';
import 'package:learning_app/utils/controllers.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key, this.url, this.height, this.width})
      : super(key: key);
  final String? url;
  final double? height;
  final double? width;
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    courseCtr.videoPlayerController =
        VideoPlayerController.network(widget.url!);
    _initializeVideoPlayerFuture =
        courseCtr.videoPlayerController!.initialize();
    courseCtr.videoPlayerController!.setLooping(true);
    // courseCtr.LoadVedio(widget.url!);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: courseCtr.videoPlayerController!.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(courseCtr.videoPlayerController!),
                  const CircleAvatar(
                    backgroundColor: Colors.white10,
                    radius: 50,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 40,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (courseCtr.videoPlayerController!.value.isPlaying) {
                        courseCtr.videoPlayerController!.pause();
                      } else {
                        // If the video is paused, play it.
                        courseCtr.videoPlayerController!.play();
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(
                        Icons.play_arrow,
                        color: AppColorCode.brandColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
