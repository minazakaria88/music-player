

abstract class AppState{}

class InitState extends AppState{}

class GetSongsSuccessState extends AppState{}


class GetSongsErrorsState extends AppState{
  late final String error;
  GetSongsErrorsState(this.error);
}


class ChangeSliderValue extends AppState{}
class PlayOrPauseState extends AppState{}
class SetDurationState extends AppState{}

class SetPlayedSongModel extends AppState{}