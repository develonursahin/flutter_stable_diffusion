import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stable_diffusion/app/core/constants/app_text_style.dart';
import 'package:flutter_stable_diffusion/app/core/extensions/widget/widget_extension.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/model_select_view.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/prompt_bloc.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/prompt_event.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/promt_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/widgets/steps_counter_widget.dart';

class PromptView extends StatelessWidget {
  const PromptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromptBloc, PromptState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<PromptBloc>(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Text 2 Image",
              style: AppTextStyle.whiteSemiBold20,
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ModelSelectView()),
                  );
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: bloc.positivePromptController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Positive Prompt *',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a positive prompt';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: bloc.negativePromptController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Negative Prompt (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          controller: bloc.imageWidthController,
                          decoration: const InputDecoration(
                            labelText: 'Image Width',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox(width: 5)),
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          controller: bloc.imageHeightController,
                          decoration: const InputDecoration(
                            labelText: 'Image Height',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                  const StepsCounterWidget(),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<PromptBloc>(context).add(
                        GenerateImageEvent(
                          positivePrompt: bloc.positivePromptController.text,
                          negativePrompt: bloc.negativePromptController.text,
                          steps: bloc.steps,
                          width: bloc.imageWidthController.text.isNotEmpty
                              ? int.parse(bloc.imageWidthController.text)
                              : null,
                          height: bloc.imageHeightController.text.isNotEmpty
                              ? int.parse(bloc.imageHeightController.text)
                              : null,
                        ),
                      );
                    },
                    child: const Text('Generate Image'),
                  ),
                  const SizedBox(height: 20),
                  if (state is PromptLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  else if (state is PromptLoaded && state.imageData.isNotEmpty)
                    Image.memory(
                      base64Decode(state.imageData),
                      fit: BoxFit.contain,
                    ).gestureDetector(
                      onLongPress: () {
                        if (state.imageData.isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Save Image'),
                                content:
                                    const Text('Do you want to save this image to your gallery?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Save'),
                                    onPressed: () {
                                      bloc.saveImageToGallery(base64Decode(state.imageData));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
