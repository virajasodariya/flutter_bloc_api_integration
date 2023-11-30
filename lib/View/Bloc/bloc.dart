import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_integration/Model/product_response_model.dart';
import 'package:flutter_bloc_api_integration/Repo/product_repo.dart';
import 'package:flutter_bloc_api_integration/View/Bloc/bloc_events.dart';
import 'package:flutter_bloc_api_integration/View/Bloc/bloc_states.dart';

class ProductBloc extends Bloc<BlocProductEvent, BlocProductState> {
  ProductBloc() : super(BlocProductInitial()) {
    on<BlocProductFetch>((event, emit) => fetchData(emit));
  }

  Future<void> fetchData(Emitter<BlocProductState> emit) async {
    {
      try {
        emit(BlocProductLoading());

        ProductResponseModel responseModel = await ProductRepo.getProduct();

        emit(BlocProductLoaded(responseModel));
      } catch (error) {
        log('Error fetching posts: $error');

        emit(BlocProductError(error.toString()));
      }
    }
  }
}
