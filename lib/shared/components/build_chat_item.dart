import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../function/function.dart';
import 'chat_screen_details.dart';

class BuildChatItem extends StatelessWidget {
  final UserModel model;

  const BuildChatItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          navigateTo(context, ChatScreenDetails(model: model), false);
        },
        radius: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage('${model.image}'),
                    ),
                    const CircleAvatar(
                      radius: 9.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 6.0,
                        backgroundColor: Colors.green,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            Icons.check_circle,
                            size: 18.0,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            model.lastMessage?.messageText ?? 'No messages yet',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            model.lastMessage?.messageDate ?? '',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.chat_outlined,
                color: Colors.grey[700],
              ),
            )
          ],
        ),
      ),
    );
  }
}
