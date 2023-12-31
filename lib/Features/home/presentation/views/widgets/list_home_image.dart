import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/Features/home/presentation/manager/app_cubit.dart';
import 'package:music_player/Features/home/presentation/manager/app_state.dart';

class ListHomeImage extends StatelessWidget {
  const ListHomeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.asset(
                'assets/images/music.jpeg',
                fit: BoxFit.fill,

              ),
            ),
            Container(
              margin:  EdgeInsets.only(
                left: 20,
                top: MediaQuery.of(context).size.height * 0.192,
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.title,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(
                     cubit.artist,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}