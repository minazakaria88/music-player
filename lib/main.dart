import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/data/repos/home_repo_imp.dart';
import 'package:music_player/Features/home/presentation/manager/app_cubit.dart';
import 'package:music_player/Features/home/presentation/views/list_home_view.dart';
void main() {

  runApp(const MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AppCubit(HomeRepoImp())..askPermission(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListHomeView(),
      ),
    );
  }
}

