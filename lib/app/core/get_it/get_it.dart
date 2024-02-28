import 'package:flutter_stable_diffusion/app/data/services/sd_service.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/bloc/model_select_bloc.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/prompt_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
SDService service = SDService();
void setupGetIT() {
  setupRepositories();
  setupBLoCs();
}

void setupRepositories() {
  getIt.registerLazySingleton<SDService>(
    () => SDService(),
  );
}

void setupBLoCs() {
  getIt
    ..registerLazySingleton<ModelSelectBloc>(() => ModelSelectBloc(service: service))
    ..registerLazySingleton<PromptBloc>(() => PromptBloc());
}
