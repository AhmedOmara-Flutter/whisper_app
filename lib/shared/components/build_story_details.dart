import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/story_model.dart';
import '../styles/colors.dart';

// ignore: must_be_immutable
class BuildStoryDetails extends StatefulWidget {
  final StoryModel model;

  BuildStoryDetails({super.key, required this.model});

  @override
  State<BuildStoryDetails> createState() => _BuildStoryDetailsState();
}

class _BuildStoryDetailsState extends State<BuildStoryDetails>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();

    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          // Check if the widget is still mounted
          print('Animation completed!');
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15.0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xfff9f1fc),
                image: DecorationImage(
                    image: NetworkImage('${widget.model.storyImage}'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: controller!,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          value: controller!.value,
                          color: baseColor,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              NetworkImage('${widget.model.image}'),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${widget.model.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${widget.model.date}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Image.asset(
                            'images/option.png',
                            height: 22.0,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 70.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22.0,
                    backgroundColor: Colors.grey[700],
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(25.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'send message...',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const CircleAvatar(
                      radius: 22.0,
                      backgroundColor: Colors.red,
                      child: Icon(
                        CupertinoIcons.heart_solid,
                        size: 30.0,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  CircleAvatar(
                      radius: 22.0,
                      backgroundColor: Colors.blue,
                      child: Image.asset(
                        'images/like.png',
                        color: Colors.white,
                        height: 30.0,
                        width: 30.0,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
