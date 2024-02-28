// State
abstract class ModelSelectState {
  List<String> get models => [];
  bool get isLoadingModels => false;
  bool get isSettingOptions => false;
  String? get selectedModel => null;
}

class ModelSelectLoadingModels extends ModelSelectState {
  @override
  final bool isLoadingModels;

  ModelSelectLoadingModels(this.isLoadingModels);
}

class ModelSelectSettingOptions extends ModelSelectState {
  @override
  final bool isSettingOptions;

  ModelSelectSettingOptions(this.isSettingOptions);
}

class ModelSelectLoaded extends ModelSelectState {
  @override
  final List<String> models;
  @override
  final String? selectedModel;
  @override
  final bool isLoadingModels;
  @override
  final bool isSettingOptions;

  ModelSelectLoaded(this.models, this.selectedModel, this.isLoadingModels, this.isSettingOptions);
}

class ModelSelectError extends ModelSelectState {
  final String message;

  ModelSelectError(this.message);
}
