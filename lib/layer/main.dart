import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenlife/core/Bloc/ThemeBloc/ThemeBloc.dart';
import 'package:greenlife/core/router/AppRoute.dart';
import 'package:greenlife/layer/SplashScreen.dart';
import '../core/theme/AppTheme.dart';

void main() {

  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>ThemeBloc()..add(LoadThemeEvent())),
      ],
      child: BlocBuilder<ThemeBloc,ThemeState>(
          builder: (context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppTheme.appName,
          theme: state.theme,
          initialRoute: AppRoute.initialRoute,
          onGenerateRoute: AppRoute.generateRoute,
          themeMode: .system,
          home: SplashScreen(),
        );
      }),
    );
  }
}


