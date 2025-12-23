import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lost_project/modules/login/login_screen.dart';
import '../../layout/chat_home_layout.dart';

navigateTo(context, screen, bool isFinish) {
  if (isFinish) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        result: (route) => isFinish);
  } else {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }
}

// flutterToast({required String msg, Color? textColor}) {
//   return Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: textColor,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

snakeBar({required String text, required context, required Color color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    ),
  );
}

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

showPopup(
    {required BuildContext context,
    Widget? title,
    String? text,
    List<Widget>? action}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: title,
        content: Text(
          text!,
          style: const TextStyle(
              color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        actions: action,
      );
    },
  );
}

Widget startWidget(String uId) {
  Widget widget;

  print(uId);
  if (uId.isNotEmpty) {
    widget =  ChatHomeLayout();
  } else {
    widget =  const ChatLoginScreen();
  }
  return widget;
}

// void showModalBottomSheet({required context,   dynamic Function(BuildContext) ?builder,}) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         height: 200,
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const Text('Modal Bottom Sheet'),
//               ElevatedButton(
//                 child: const Text('Close Bottom Sheet'),
//                 onPressed: () => Navigator.pop(context),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
