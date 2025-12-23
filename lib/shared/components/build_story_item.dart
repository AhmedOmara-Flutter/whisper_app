import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/story_model.dart';
import '../cubit/chat_app_cubit.dart';
import '../cubit/chat_app_state.dart';
import '../function/function.dart';
import '../styles/colors.dart';
import 'build_story_details.dart';

class BuildStoryItem extends StatelessWidget {
  final StoryModel model;

  const BuildStoryItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            navigateTo(
                context,
                BuildStoryDetails(
                  model: model,
                ),
                false);
          },
          borderRadius: BorderRadius.circular(15.0),
          radius: 0.0,
          child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              width: 130.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${model.storyImage}'),
                    fit: BoxFit.cover,
                  ),
                  color: const Color(0xfff7f2f9),
                  border: Border.all(color: Colors.black.withOpacity(0.04)),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28.0,
                          backgroundColor: baseColor,
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage('${model.image}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      '${model.name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
