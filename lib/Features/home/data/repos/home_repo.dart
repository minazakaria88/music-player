

import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class HomeRepo
{
  Future<PermissionStatus> askPermission();
  Future<List<SongModel>> getLocalSongs();
}