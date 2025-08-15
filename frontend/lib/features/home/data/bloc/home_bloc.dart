import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/home/data/repositories/home_repository.dart';

import '../../../../models/category.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBlocBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;
  
  HomeBlocBloc(this.repository) : super(HomeLoading()) {
    on<LoadHome>((event, emit) async {
      emit(HomeLoading());
      try {
        final categories = await repository.fetchCategories();
        emit(HomeLoaded(categories));
      } catch (e){
        print(e);
        emit(HomeError());
      }
    });
  }
}
