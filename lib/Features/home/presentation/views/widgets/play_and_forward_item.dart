import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/presentation/manager/app_cubit.dart';
import 'package:music_player/Features/home/presentation/manager/app_state.dart';
import 'package:music_player/Features/home/presentation/views/widgets/play_pause_button.dart';




class PlayAndForward extends StatelessWidget {
  const PlayAndForward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
     builder: (context, state) {
       var cubit=AppCubit.get(context);
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             IconButton(
               onPressed: (){
                 cubit.index+=1;
                   String uri=cubit.songs[cubit.index].uri.toString();
                   cubit.playSong(uri);
                 cubit.setPlayedSongModel(cubit.songs[cubit.index]);
               },
               icon: const Icon(
                 Icons.fast_forward,
                 color: Colors.white,
               ),
             ),
             PlayPauseButton(
               isPlay: cubit.isPlay,
               press: (){
                 cubit.playOrPause();
                 if(cubit.isPlay)
                   {
                     cubit.playSong(cubit.songModel!.uri);
                   }
                 else
                   {
                     cubit.pauseSong();
                   }

               },
             ),
             IconButton(
               onPressed: (){
                 cubit.index-=1;
                 String uri=cubit.songs[cubit.index].uri.toString();
                 cubit.playSong(uri);
                 cubit.setPlayedSongModel(cubit.songs[cubit.index]);
               },
               icon: const Icon(
                 Icons.fast_rewind,
                 color: Colors.white,
               ),
             ),
           ],
         ),
       );
     },
    );
  }
}

