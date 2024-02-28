// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stable_diffusion/app/data/models/image2image_model.dart';
import 'package:flutter_stable_diffusion/app/data/models/text2image_model.dart';
import 'package:flutter_stable_diffusion/app/data/services/sd_service.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/prompt_event.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/promt_state.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  final SDService _service = SDService();
  Text2ImageModel? text2ImageModel;
  Image2ImageModel? image2ImageModel;
  String? selectedImagePath;

  final TextEditingController positivePromptController = TextEditingController();
  final TextEditingController negativePromptController = TextEditingController();
  final TextEditingController imageHeightController = TextEditingController();
  final TextEditingController imageWidthController = TextEditingController();

  int steps = 20;

  PromptBloc() : super(PromptInitial()) {
    on<GenerateImageEvent>(_onGenerateImageEvent);
  }

  Future<void> _onGenerateImageEvent(GenerateImageEvent event, Emitter<PromptState> emit) async {
    emit(PromptLoading());
    text2ImageModel = Text2ImageModel(
      prompt: event.positivePrompt,
      negativePrompt: event.negativePrompt,
      steps: event.steps,
      width: event.width,
      height: event.height,
    );
    try {
      final result = await _service.text2Image(text2ImageModel: text2ImageModel!);

      if (result != null) {
        emit(PromptLoaded(result));
      } else {
        emit(PromptError());
      }
    } catch (e) {
      emit(PromptError());
    }
  }

  void updateCounter(bool increment, {bool isClipStopLayers = false}) {
    steps = increment ? steps + 1 : steps - 1;
    steps = steps.clamp(1, 100);
    emit(PromptUpdated(steps: steps));
  }

  Future<void> saveImageToGallery(Uint8List imageData) async {
    final result = await ImageGallerySaver.saveImage(imageData);

    if (kDebugMode) {
      if (result['isSuccess']) {
        print('Image saved to gallery');
      } else {
        print('Failed to save image');
      }
    }
  }
}
