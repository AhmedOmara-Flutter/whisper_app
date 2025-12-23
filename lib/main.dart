import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:lost_project/shared/components/constants.dart';
import 'package:lost_project/shared/cubit/bloc_observer.dart';
import 'package:lost_project/shared/function/function.dart';
import 'package:lost_project/shared/network/local/cache_helper.dart';
import 'package:lost_project/src/app_root.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  //في حاله cache helper لازم اعمل await ليها عند استدعائها
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId') ?? '';
  Widget start = startWidget(uId);
  runApp(AppRoot(
    startWidget: start,
  ));
}
