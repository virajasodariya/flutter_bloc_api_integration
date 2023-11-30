import 'package:flutter_bloc_api_integration/Model/product_response_model.dart';

abstract class BlocProductState {}

class BlocProductInitial extends BlocProductState {}

class BlocProductLoading extends BlocProductState {}

class BlocProductLoaded extends BlocProductState {
  final ProductResponseModel posts;
  BlocProductLoaded(this.posts);
}

class BlocProductError extends BlocProductState {
  final String errorMessage;
  BlocProductError(this.errorMessage);
}
