// State

abstract class PromptState {}

class PromptInitial extends PromptState {}

class PromptLoading extends PromptState {}

class PromptLoaded extends PromptState {
  final String imageData;

  PromptLoaded(this.imageData);
}

class PromptError extends PromptState {}

class PromptUpdated extends PromptState {
  final int steps;

  PromptUpdated({required this.steps});
}

class PromptImageSelected extends PromptState {
  final String? imageData;

  PromptImageSelected({
    this.imageData,
  });
}
