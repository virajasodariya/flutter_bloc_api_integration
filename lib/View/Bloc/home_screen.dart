import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_integration/View/Bloc/bloc.dart';
import 'package:flutter_bloc_api_integration/View/Bloc/bloc_events.dart';
import 'package:flutter_bloc_api_integration/View/Bloc/bloc_states.dart';

class BlocHomeScreen extends StatefulWidget {
  const BlocHomeScreen({super.key});

  @override
  State<BlocHomeScreen> createState() => _BlocHomeScreenState();
}

class _BlocHomeScreenState extends State<BlocHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(BlocProductFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clean Architecture Cubit"),
      ),
      body: Center(
        child: BlocBuilder<ProductBloc, BlocProductState>(
          builder: (context, state) {
            if (state is BlocProductInitial) {
              return const Text("Init Data Loading...!");
            } else if (state is BlocProductLoading) {
              return const CircularProgressIndicator();
            } else if (state is BlocProductError) {
              return Text(state.errorMessage);
            } else if (state is BlocProductLoaded) {
              return ListView.builder(
                itemCount: state.posts.products!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${state.posts.products![index].id}"),
                    title: Text("${state.posts.products![index].title}"),
                    subtitle: Image.network(
                        "${state.posts.products![index].thumbnail}"),
                  );
                },
              );
            } else {
              return const Text("Something Went Wrong...!");
            }
          },
        ),
      ),
    );
  }
}
