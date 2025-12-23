import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/chat_app_cubit.dart';
import '../cubit/chat_app_state.dart';
import '../function/function.dart';
import '../styles/colors.dart';

class AddNewStory extends StatelessWidget {
  const AddNewStory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is CreateStorySuccessState) {
          snakeBar(
              context: context,
              text: 'Story Added successful!',
              color: Colors.green);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = ChatAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.0,
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  if (cubit.storyImage != null)
                    Image(
                      image: FileImage(cubit.storyImage!),
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  )
                ],
              )),
              Container(
                width: double.infinity,
                height: 60.0,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConditionalBuilder(
                      condition: state is! CreateStoryLoadingState &&
                          state is! UploadStoryLoadingState,
                      builder: (context) => Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              var now = DateTime.now();
                              String formattedTime =
                                  DateFormat('kk:mm').format(now);
                              cubit.uploadStoryImage(date: formattedTime);
                            },
                            icon: Icon(
                              Icons.done,
                              color: baseColor,
                            )),
                      ),
                      fallback: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
