import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/cubit/admin_states.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/layout/layout.dart';
import 'package:academic_calendar/models/shared_preference.dart';
import 'package:academic_calendar/modules/login_screen/login_screen.dart';
import 'package:academic_calendar/shared/bloc_observer.dart';
import 'package:academic_calendar/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await cache_helper.init();
  Widget? widget;
  if (cache_helper.getData(key: 'uid') != null) {
    widget = const LayoutScreen();
  } else {
    widget = const LoginScreen();
  }
  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdminCubit()
            ..changeAppTheme(fromSP: cache_helper.getData(key: 'isdark'))
            ..getEvents(),
        )
      ],
      child: BlocBuilder<AdminCubit, AdminStates>(
        builder: (context, state) {
          bool isbark = AdminCubit.get(context).isdark;
          return MaterialApp(
            title: 'التقويم الدراسي',
            locale: const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: isbark ? lightmode : darkmode,
            home: startWidget,
          );
        },
      ),
    );
  }
}
