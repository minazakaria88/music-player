import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/presentation/manager/app_cubit.dart';
import 'package:music_player/Features/home/presentation/manager/app_state.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../home_view.dart';
import 'ListItem.dart';

class ListOfSongs extends StatelessWidget {
  const ListOfSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        List<SongModel> list = AppCubit.get(context).songs;
        return Expanded(
          child: list.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => ListItem(
                    model: list[index],
                    itemPress: () {
                      AppCubit.get(context).index=index;
                      AppCubit.get(context).playSong(list[index].uri);
                      AppCubit.get(context).setPlayedSongModel(list[index]);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  const HomeView(),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      height: 2,
                      //color: color1,
                    ),
                  ),
                  itemCount: list.length,
                ),
        );
      },
    );
  }
}
