import 'package:music_player/Features/home/data/repos/home_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:permission_handler/permission_handler.dart';

class HomeRepoImp implements HomeRepo {
  @override
  Future<PermissionStatus> askPermission() async {
    return await Permission.audio.request();
  }

  @override
  Future<List<SongModel>> getLocalSongs() async {
    final OnAudioQuery audioQuery = OnAudioQuery();
    List<SongModel>list=[];
     try
         {
           list=await audioQuery.querySongs(
             ignoreCase:true,
           );
         }catch(e){

     }
     return list;
  }
}
