import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stable_diffusion/app/core/extensions/widget/widget_extension.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/prompt_bloc.dart';
import 'package:flutter_stable_diffusion/app/presentation/prompt/bloc/promt_state.dart';

class StepsCounterWidget extends StatelessWidget {
  const StepsCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromptBloc, PromptState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<PromptBloc>(context);

        return Row(
          children: [
            const Expanded(
              child: Text(
                "Steps",
                style: TextStyle(fontSize: 16),
              ),
            ),
            IconButton(icon: const Icon(Icons.remove), onPressed: () => bloc.updateCounter(false)),
            Text(
              bloc.steps.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(icon: const Icon(Icons.add), onPressed: () => bloc.updateCounter(true)),
          ],
        ).pSymmetric(vertical: 20);
      },
    );
  }
}
