import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stable_diffusion/app/core/constants/app_color.dart';

import 'package:flutter_stable_diffusion/app/core/get_it/get_it.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/bloc/model_select_bloc.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/prompt_bloc.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/prompt_view.dart';

void main() {
  setupGetIT();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ModelSelectBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<PromptBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter with Stable Diffusion',
        theme: lightTheme(),
        home: const PromptView(),
        darkTheme: darkTheme(),
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.white,
        scrolledUnderElevation: 0,
      ),
      scaffoldBackgroundColor: AppColor.white,
      useMaterial3: true,
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.black,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      scaffoldBackgroundColor: AppColor.black,
      useMaterial3: true,
      primaryColorDark: AppColor.black,
      cardColor: AppColor.black,
      primaryColor: AppColor.black,
      dialogTheme: const DialogTheme(backgroundColor: AppColor.black),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColor.white),
        bodyMedium: TextStyle(color: AppColor.white),
        displayLarge: TextStyle(color: AppColor.white),
        displayMedium: TextStyle(color: AppColor.white),
        displaySmall: TextStyle(color: AppColor.white),
        headlineMedium: TextStyle(color: AppColor.white),
        headlineSmall: TextStyle(color: AppColor.white),
        titleLarge: TextStyle(color: AppColor.white),
        titleMedium: TextStyle(color: AppColor.white),
        titleSmall: TextStyle(color: AppColor.white),
        bodySmall: TextStyle(color: AppColor.white),
        labelLarge: TextStyle(color: AppColor.white),
        labelSmall: TextStyle(color: AppColor.white),
      ),
    );
  }
}
