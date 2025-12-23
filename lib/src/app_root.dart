import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_project/shared/components/constants.dart';
import '../shared/cubit/chat_app_cubit.dart';

class AppRoot extends StatelessWidget {
  final Widget? startWidget;

  const AppRoot({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ChatAppCubit()
              ..getUserdata()
              ..getStory()
              ..getPosts()),
      ],
      child: MaterialApp(
        theme: kThemeData,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
