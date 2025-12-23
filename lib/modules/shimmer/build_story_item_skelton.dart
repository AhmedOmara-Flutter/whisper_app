import 'package:flutter/material.dart';
import 'package:lost_project/modules/shimmer/skelton.dart';

import '../../models/story_model.dart';

class BuildStoryItemSkelton extends StatelessWidget {
  final StoryModel? model;

  const BuildStoryItemSkelton({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          height: 210.0,
          width: 130.0,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.09),
              borderRadius: BorderRadius.circular(15.0)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: Skelton(
            isCircle: true,
            height: 65.0,
            width: 65.0,
          ),
        )
      ],
    );
  }
}
