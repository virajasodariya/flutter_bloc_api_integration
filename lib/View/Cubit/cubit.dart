import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_integration/Model/post_response_model.dart';
import 'package:flutter_bloc_api_integration/Repo/post_repo.dart';
import 'package:flutter_bloc_api_integration/View/Cubit/cubit_states.dart';

class PostCubit extends Cubit<CubitPostState> {
  PostCubit() : super(CubitPostInitial());

  Future<void> fetchPosts() async {
    try {
      emit(CubitPostLoading());

      List<PostResponseModel> responseModel = await PostRepo.getPost();

      emit(CubitPostLoaded(responseModel));
    } catch (error) {
      log('Error fetching posts: $error');

      emit(CubitPostError(error.toString()));
    }
  }
}
