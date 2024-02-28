// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stable_diffusion/app/data/services/sd_service.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/bloc/model_select_event.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/bloc/model_select_state.dart';

class ModelSelectBloc extends Bloc<ModelSelectEvent, ModelSelectState> {
  final SDService _service;

  ModelSelectBloc({required SDService service})
      : _service = service,
        super(ModelSelectLoaded([], null, false, false)) {
    on<LoadModelsEvent>(_onLoadModelsEvent);
    on<SelectModelEvent>(_onSelectModelEvent);
    on<SetOptionsEvent>(_onSetOptionsEvent);
  }

  Future<void> _onLoadModelsEvent(LoadModelsEvent event, Emitter<ModelSelectState> emit) async {
    emit(ModelSelectLoadingModels(true));
    try {
      final models = await _service.fetchModels();
      emit(ModelSelectLoaded(models, state.selectedModel, false, state.isSettingOptions));
    } catch (e) {
      emit(ModelSelectError(e.toString()));
    }
  }

  void _onSelectModelEvent(SelectModelEvent event, Emitter<ModelSelectState> emit) {
    if (event.selectedModel != null) {
      emit(ModelSelectLoaded(
          state.models, event.selectedModel, state.isLoadingModels, state.isSettingOptions));
    }
  }

  Future<void> _onSetOptionsEvent(SetOptionsEvent event, Emitter<ModelSelectState> emit) async {
    emit(ModelSelectSettingOptions(true));

    try {
      final options = {"sd_model_checkpoint": event.selectedModel};
      final success = await _service.setOptions(options);
      if (success) {
        emit(ModelSelectLoaded(state.models, event.selectedModel, false, false));
        add(LoadModelsEvent());
      } else {
        emit(ModelSelectError("Error setting options"));
      }
    } catch (e) {
      emit(ModelSelectError(e.toString()));
    }
  }
}
