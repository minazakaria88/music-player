import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key, required this.press, this.isPlay=false,
  });
  final Function press;
  final bool isPlay;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: color1,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            press();
          },
          child:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              isPlay ? Icons.pause :Icons.play_arrow,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}