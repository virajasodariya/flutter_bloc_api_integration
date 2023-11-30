import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_integration/View/Bloc/bloc.dart';

var allBlocProvider = [
  // BlocProvider(create: (context) => PostCubit()),
  BlocProvider(create: (context) => ProductBloc()),
];
