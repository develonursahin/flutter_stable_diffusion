import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stable_diffusion/app/core/constants/app_color.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/bloc/model_select_bloc.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/bloc/model_select_event.dart';
import 'package:flutter_stable_diffusion/app/presentation/model_select/bloc/model_select_state.dart';

class ModelSelectView extends StatelessWidget {
  const ModelSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoadModelsEvent'i tetikle
    BlocProvider.of<ModelSelectBloc>(context).add(LoadModelsEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Model Select"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ModelSelectBloc, ModelSelectState>(
              builder: (context, state) {
                if (state is ModelSelectLoadingModels) {
                  return const CircularProgressIndicator();
                } else if (state is ModelSelectLoaded) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: state.models.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final model = state.models[index];
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<ModelSelectBloc>(context).add(SelectModelEvent(model));
                        },
                        child: Card(
                          color: state.selectedModel == model ? Colors.blue : AppColor.black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://picsum.photos/20$index',
                                height: 80,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                model,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("Error loading models");
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final selectedModel = BlocProvider.of<ModelSelectBloc>(context).state.selectedModel;
                if (selectedModel != null) {
                  BlocProvider.of<ModelSelectBloc>(context).add(SetOptionsEvent(selectedModel));
                }
              },
              child: BlocBuilder<ModelSelectBloc, ModelSelectState>(
                builder: (context, state) {
                  return state.isSettingOptions
                      ? const CircularProgressIndicator()
                      : const Text('Set Options');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
