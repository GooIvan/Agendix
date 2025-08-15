part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];

}

class HomeLoaded extends HomeState {
  final List<Category> categories;

  const HomeLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}
class HomeLoading extends HomeState{} 
class HomeError extends HomeState{} 

