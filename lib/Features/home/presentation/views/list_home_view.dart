import 'package:flutter/material.dart';
import 'package:music_player/Features/home/presentation/views/widgets/list_home_view_body.dart';
import 'package:music_player/constant.dart';


class ListHomeView extends StatelessWidget {
   const ListHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color2,
      body: ListHomeViewBody(),
    );
  }
}
