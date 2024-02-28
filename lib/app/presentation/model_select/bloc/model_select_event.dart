// Event
abstract class ModelSelectEvent {}

class LoadModelsEvent extends ModelSelectEvent {}

class SelectModelEvent extends ModelSelectEvent {
  final String? selectedModel;

  SelectModelEvent(this.selectedModel);
}

class SetOptionsEvent extends ModelSelectEvent {
  final String selectedModel;

  SetOptionsEvent(this.selectedModel);
}
