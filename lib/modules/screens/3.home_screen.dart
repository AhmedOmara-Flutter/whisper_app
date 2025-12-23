import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/add_new_story.dart';
import '../../shared/components/build_my_story.dart';
import '../../shared/components/build_post_item.dart';
import '../../shared/components/build_story_item.dart';
import '../../shared/cubit/chat_app_cubit.dart';
import '../../shared/cubit/chat_app_state.dart';
import '../../shared/function/function.dart';
import '../../shared/styles/colors.dart';
import '../shimmer/build_story_item_skelton.dart';
import '6.add_new_post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ChatAppCubit.get(context);
        return RefreshIndicator(
          color: baseColor,
          onRefresh: () async {
            await cubit.getPosts();
            await cubit.getStory();
            await cubit.getAllUsers();
            return Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      if (cubit.userModel != null)
                        CircleAvatar(
                          radius: 22.0,
                          backgroundImage:
                              NetworkImage('${cubit.userModel!.image}'),
                        ),
                      Expanded(
                        child: InkWell(
                          radius: 50.0,
                          onTap: () {
                            navigateTo(context, AddNewPost(), false);
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 2.0)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 7.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.post_add,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'What is on your mind...',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 17.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                    thickness: 5.0,
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BuildMyStory(
                        onTap: () {
                          cubit.getStoryImage().then((value) {
                            navigateTo(context, const AddNewStory(), false);
                          });
                        },
                      ),
                      ConditionalBuilder(
                        condition: cubit.stories.length > 0,
                        builder: (context) => Container(
                          height: 210.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => BuildStoryItem(
                              model: cubit.stories[index],
                            ),
                            itemCount: cubit.stories.length,
                          ),
                        ),
                        fallback: (context) => Container(
                          height: 210.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                BuildStoryItemSkelton(
                              model: cubit.stories[index],
                            ),
                            itemCount: cubit.stories.length,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 5.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ConditionalBuilder(
                    condition: state is! ChatGetPostsLoadingState &&
                        cubit.userModel != null,
                    builder: (context) => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      itemBuilder: (context, index) => BuildPostItem(
                        index: index,
                        model: cubit.posts[index],
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 10.0,
                      ),
                      itemCount: cubit.posts.length,
                    ),
                    fallback: (context) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 200.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: baseColor,
                        ),
                      ),
                    ),
                  ),
                ),
                if (cubit.posts.isEmpty)
                Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://img.freepik.com/free-ve'
                            'ctor/flat-design-no-data-illustra'
                            'tion_23-2150527124.jpg?t=st=1720959839~'
                            'exp=1720963439~hmac=b885f355c1b82971bae23981f96a3f'
                            'abeb28f1c0d53c63bc5282086a1e423c81&w=740',
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'No posts available!',
                            style: TextStyle(
                              color: baseColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'It seems a bit empty here.\nStart a new conversation or refresh to see new posts.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
