import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jilli/Home/profile_screen.dart';
import 'package:jilli/classes.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  final ImagePicker _picker = ImagePicker();

  Future<void> _openGallery(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the selected image here
      print('Selected image path: ${image.path}');
    }
    Navigator.pop(context); // Close the bottom sheet after selection
  }

  Future<void> _openVideoGallery(BuildContext context) async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      // Handle the selected video here
      print('Selected video path: ${video.path}');
    }
    Navigator.pop(context); // Close the bottom sheet after selection
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Media> media_List = [
    Media(
        type: "image",
        media:
            "https://images.pexels.com/photos/395196/pexels-photo-395196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
    Media(
        type: "video",
        media:
            "https://videos.pexels.com/video-files/1093662/1093662-sd_640_360_30fps.mp4"),
    Media(
        type: "image",
        media:
            "https://images.pexels.com/photos/1033729/pexels-photo-1033729.jpeg?auto=compress&cs=tinysrgb&w=600")
  ];

  final ImagePicker _picker = ImagePicker();

  Future<void> _handleRefresh() async {
    // Simulate network call and fetch new data
    await Future.delayed(Duration(seconds: 2));
    // setState(() {
    //   // Example: Add a new media item for demonstration
    //   media_List.add(Media(
    //       type: "image",
    //       media:
    //           "https://images.pexels.com/photos/1231231/pexels-photo-1231231.jpeg?auto=compress&cs=tinysrgb&w=600"));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              // color: Colors.pink,
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: AssetImage('assets/image/camera.png'),
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/image/logo.png'),
                      fit: BoxFit.contain,
                      height: 30,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Image(
                            image: AssetImage('assets/image/plus.png'),
                            fit: BoxFit.cover,
                            height: 25,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.all(16.0),
                                  height: 150,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(Icons.image),
                                        title: Text('Select Image'),
                                        onTap: () async {
                                          await widget._openGallery(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.videocam),
                                        title: Text('Select Video'),
                                        onTap: () async {
                                          await widget
                                              ._openVideoGallery(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: Image(
                            image: AssetImage('assets/image/profile.png'),
                            fit: BoxFit.cover,
                            height: 25,
                          ),
                          iconSize: 50,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => profile_screen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView.builder(
                  itemCount: media_List
                      .length, // Replace with the length of your data list
                  itemBuilder: (context, index) {
                    return post_cell(media: media_List[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class post_cell extends StatefulWidget {
  final Media media;

  post_cell({required this.media});

  @override
  State<post_cell> createState() => _post_cellState();
}

class _post_cellState extends State<post_cell> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.media.type == 'video') {
      _controller = VideoPlayerController.network(widget.media.media)
        ..initialize().then((_) {
          setState(() {});
          // _controller.play();
        });
    }
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = _controller.value.isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/image/profile.png'),
                    fit: BoxFit.cover,
                    height: 35,
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 13),
                      child: Text(
                        'Rinku Panchal Update',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "16 jul 2024",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "...",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: widget.media.type == 'image'
                  ? Image.network(
                      widget.media.media,
                      fit: BoxFit.fill,
                    )
                  : _controller.value.isInitialized
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                            if (!_isPlaying)
                              IconButton(
                                icon: Icon(
                                    _isPlaying ? Icons.pause : Icons.play_arrow,
                                    size: 50.0),
                                onPressed: _togglePlayPause,
                              ),
                          ],
                        )
                      : Center(child: CircularProgressIndicator()),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/image/like.png'),
                    fit: BoxFit.fill,
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: AssetImage('assets/image/comment.png'),
                    fit: BoxFit.fill,
                    height: 20,
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('assets/image/share.png'),
                    fit: BoxFit.fill,
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
