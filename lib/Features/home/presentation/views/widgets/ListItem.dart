import 'package:flutter/material.dart';
import 'package:music_player/constant.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.itemPress,
    required this.model,
  });
  final Function itemPress;
  final SongModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        color: color2,
      ),
      child: InkWell(
        onTap: () {
          itemPress();
        },
        child: Row(
          children: [
            QueryArtworkWidget(
                id: model.id,
              keepOldArtwork: true,
                type: ArtworkType.AUDIO,
              nullArtworkWidget: const Icon(Icons.music_note_sharp,color: Colors.red,),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.artist ?? 'unKnown',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.my_library_music_sharp,color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
