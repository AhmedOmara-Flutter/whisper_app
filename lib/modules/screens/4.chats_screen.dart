import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/build_chat_item.dart';
import '../../shared/cubit/chat_app_cubit.dart';
import '../../shared/cubit/chat_app_state.dart';
import '../../shared/styles/colors.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            if (ChatAppCubit.get(context).users.length > 0 &&
                state is! ChatGetAllUsersLoadingState)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      prefixIcon: const Icon(Icons.search),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: baseColor),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Search...'),
                ),
              ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ConditionalBuilder(
                  condition: ChatAppCubit.get(context).users.length > 0 &&
                      state is! ChatGetAllUsersLoadingState,
                  builder: (context) => ListView.builder(
                        itemBuilder: (context, index) => BuildChatItem(
                            model: ChatAppCubit.get(context).users[index]),
                        itemCount: ChatAppCubit.get(context).users.length,
                      ),
                  fallback: (context) => SizedBox(
                        width: double.infinity,
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
                              'No Users Found!',
                              style: TextStyle(
                                color: baseColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'It seems a bit empty here.\nStart a new conversation or refresh to see new Users.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),),
            ),
          ],
        );
      },
    );
  }
}
