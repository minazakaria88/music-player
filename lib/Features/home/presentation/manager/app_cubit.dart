
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/data/repos/home_repo.dart';
import 'package:music_player/Features/home/presentation/manager/app_state.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit(this.homeRepo):super(InitState());

  static AppCubit get(context)=>BlocProvider.of(context);
   final HomeRepo homeRepo;

   List<SongModel> songs=[];
  void getSongs()
  {
    homeRepo.getLocalSongs().then((value) {
      songs=value;
      emit(GetSongsSuccessState());
    }).catchError((error){
      emit(GetSongsErrorsState(error.toString()));
    });
  }

  void askPermission()
  {
    try
        {
          homeRepo.askPermission().then((value) {
            getSongs();
          });
        }catch(e)
    {
       log(e.toString());
    }
  }


  void changeSliderValue(int second)
  {
    Duration duration1=Duration(seconds: second);
    player.seek(duration1);
    if(duration.toString().split('.')[0]==duration1.toString().split('.')[0])
      {
        isPlay=false;
      }
    else
      {
        isPlay=true;
      }
    emit(ChangeSliderValue());
  }

  final player = AudioPlayer();

  void playSong(uri)async
  {
    await player.setUrl(Uri.parse(uri).toString());
    player.play();
    isPlay=true;
    setDuration();
  }


  void pauseSong()
  {
    player.stop();
  }

  bool isPlay=false;
  void playOrPause()
  {
    isPlay=!isPlay;
    emit(PlayOrPauseState());
  }



  Duration duration= const Duration();
  Duration position=const Duration();

  void setDuration()
  {
    player.durationStream.listen((event) {
      duration=event!;
      emit(SetDurationState());
    });

    player.positionStream.listen((event) {
      position=event;
      if(duration.toString().split('.')[0]==position.toString().split('.')[0])
      {
        isPlay=false;
      }
      emit(SetDurationState());
    });


  }

    String title='';
    String artist='';
    SongModel ? songModel;
  void setPlayedSongModel(SongModel model)
  {
    title=model.title;
    artist=model.artist??'nuKnown';
    songModel=model;
    emit(SetPlayedSongModel());
  }
int index=0;
}