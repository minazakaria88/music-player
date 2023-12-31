import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/presentation/manager/app_cubit.dart';
import 'package:music_player/Features/home/presentation/manager/app_state.dart';
import 'package:music_player/Features/home/presentation/views/widgets/play_pause_button.dart';

import '../../../../../constant.dart';
import 'list_of_songs.dart';

class PlayList extends StatelessWidget {
  const PlayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.32,
          ),
          decoration: const BoxDecoration(
            color: color2,

            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAYLIST',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               SizedBox(
                  height: 10,
                ),
                ListOfSongs(),
              ],
            ),
          ),
        ),
        BlocBuilder<AppCubit,AppState>(
          builder: (context, state) {
            var cubit=AppCubit.get(context);
            return Container(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
              ),
              child: PlayPauseButton(
                isPlay: AppCubit.get(context).isPlay,
                press: () {
                  if(cubit.songModel!=null)
                    {
                      cubit.playOrPause();
                      if(cubit.isPlay)
                      {
                        cubit.playSong(cubit.songModel!.uri);
                      }
                      else
                      {
                        cubit.pauseSong();
                      }
                    }

                },
              ),
            );
          },
        ),
      ],
    );
  }
}


