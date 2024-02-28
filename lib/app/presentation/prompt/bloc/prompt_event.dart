abstract class PromptEvent {}

class GenerateImageEvent extends PromptEvent {
  final String positivePrompt;
  final String negativePrompt;
  final int steps;
  final int? width;
  final int? height;

  GenerateImageEvent({
    required this.positivePrompt,
    required this.negativePrompt,
    required this.steps,
    this.width,
    this.height,
  });
}
