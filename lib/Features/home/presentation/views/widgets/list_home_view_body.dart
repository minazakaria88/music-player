import 'package:flutter/material.dart';
import 'package:music_player/Features/home/presentation/views/widgets/playlist.dart';


import 'list_home_image.dart';

class ListHomeViewBody extends StatelessWidget {
  const ListHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: const Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListHomeImage(),
              Spacer(),
            ],
          ),
        ),
        const PlayList(),
      ],
    );
  }
}



