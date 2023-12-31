import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/app_cubit.dart';
import '../../manager/app_state.dart';

class StartAndEnd extends StatelessWidget {
  const StartAndEnd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit,AppState>(
     builder: (context, state) {
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 25.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
               AppCubit.get(context).position.toString().split('.')[0],
               style: const TextStyle(
                 color: Colors.white,
               ),
             ),
             Text(
               AppCubit.get(context).duration.toString().split('.')[0],
               style:const TextStyle(
                 color: Colors.white,
               ),
             ),
           ],
         ),
       );
     },
    );
  }
}