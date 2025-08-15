import 'package:frontend/features/home/data/bloc/home_bloc.dart';
import 'package:frontend/features/home/data/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository());
  sl.registerLazySingleton<HomeBlocBloc>(() => HomeBlocBloc(sl()));
}