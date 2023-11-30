import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_integration/Service/all_bloc_providers.dart';
import 'package:flutter_bloc_api_integration/View/Bloc/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: allBlocProvider,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocHomeScreen(),
      ),
    );
  }
}
