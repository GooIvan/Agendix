import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/service_locator.dart';
import 'package:frontend/features/home/data/bloc/home_bloc.dart';
import 'package:frontend/features/home/presentation/views/home_error.dart';
import 'package:frontend/features/home/presentation/views/home_loading.dart';
import 'package:frontend/features/home/presentation/views/home_success.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBlocBloc>()..add(LoadHome()),
      child: BlocBuilder<HomeBlocBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return HomeSuccessView(categories: state.categories);
          } else if (state is HomeLoading) {
            return HomeLoadingView();
          } else {
            return HomeErrorView();
          }
        },
      ),
    );
  }
}
