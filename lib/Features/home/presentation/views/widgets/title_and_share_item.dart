import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/presentation/manager/app_cubit.dart';
import 'package:music_player/Features/home/presentation/manager/app_state.dart';

import '../../../../../constant.dart';

class TitleAndShareItem extends StatelessWidget {
  const TitleAndShareItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 50,right: 20,bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppCubit.get(context).songModel!.title,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Icon(
                Icons.ios_share,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: color1,
                ),
                onPressed: (){
                },
              ),
            ],
          ),
        );
      },
    );
  }
}