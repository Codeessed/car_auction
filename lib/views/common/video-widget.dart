import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/view-models/car-view-model.dart';
import 'package:car_sale_app/theme/color.dart';
import 'package:car_sale_app/theme/sizes.dart';
import 'package:car_sale_app/views/car-details-screen.dart';
import 'package:car_sale_app/views/common/app-text.dart';
import 'package:car_sale_app/views/common/height-spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget{

  final String videoUrl;
  const VideoWidget({super.key, required this.videoUrl});

  @override
  State<StatefulWidget> createState() {
    return _VideoWidgetState();
  }

}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;



  @override
  void initState() {

    _initializePlayer(widget.videoUrl);

    super.initState();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;

    return Container(
      child: _controller.value.isInitialized ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child:  VideoPlayer(_controller),
      ): Container()
    );
  }

  // void _videoListener() {
  //   if ((_controller.value.position == _controller.value.duration) &&
  //       !_controller.value.isBuffering) {
  //     _switchToNextVideo();
  //   }
  //   setState(() {
  //
  //   });
  // }

  void _initializePlayer(String videoUrl) {
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          // _controller.addListener(_videoListener);
        });


      });
  }

}