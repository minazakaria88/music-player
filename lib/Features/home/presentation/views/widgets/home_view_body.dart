import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/presentation/manager/app_cubit.dart';
import 'package:music_player/Features/home/presentation/views/widgets/play_and_forward_item.dart';
import 'package:music_player/Features/home/presentation/views/widgets/start_and_end_duration.dart';
import 'package:music_player/Features/home/presentation/views/widgets/title_and_share_item.dart';
import 'package:music_player/constant.dart';

import '../../manager/app_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color3,
                color2,
                color2,
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
              Container(
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: color1,
                    offset: Offset(0, 7),
                    blurRadius: 4,
                  ),
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.4,
                    backgroundImage:
                        const AssetImage('assets/images/music.jpeg'),
                  ),
                ),
              ),
              const TitleAndShareItem(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cubit.songModel!.artist ?? 'unknown',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Slider(
                activeColor: color1,
                inactiveColor: color3,
                value: cubit.position.inSeconds.toDouble(),
                min: const Duration(seconds: 0).inSeconds.toDouble(),
                max: cubit.duration.inSeconds.toDouble(),
                onChanged: (value) {
                  cubit.changeSliderValue(value.toInt());
                },
              ),
              const StartAndEnd(),
              const SizedBox(
                height: 20,
              ),
              const PlayAndForward(),
            ],
          ),
        );
      },
    );
  }
}
