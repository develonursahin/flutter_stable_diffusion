import 'package:flutter_stable_diffusion/app/core/base/model/base_request_model.dart';

class Text2ImageModel extends BaseModel {
  String? prompt;
  String? negativePrompt;
  List<String>? styles;
  int? seed;
  int? subseed;
  int? subseedStrength;
  int? seedResizeFromH;
  int? seedResizeFromW;
  String? samplerName;
  int? batchSize;
  int? nIter;
  int? steps;
  int? cfgScale;
  int? width;
  int? height;
  bool? restoreFaces;
  bool? tiling;
  bool? doNotSaveSamples;
  bool? doNotSaveGrid;
  int? eta;
  int? denoisingStrength;
  int? sMinUncond;
  int? sChurn;
  int? sTmax;
  int? sTmin;
  int? sNoise;
  bool? overrideSettingsRestoreAfterwards;
  String? refinerCheckpoint;
  int? refinerSwitchAt;
  bool? disableExtraNetworks;
  bool? enableHr;
  int? firstphaseWidth;
  int? firstphaseHeight;
  int? hrScale;
  String? hrUpscaler;
  int? hrSecondPassSteps;
  int? hrResizeX;
  int? hrResizeY;
  String? hrCheckpointName;
  String? hrSamplerName;
  String? hrPrompt;
  String? hrNegativePrompt;
  String? samplerIndex;
  String? scriptName;
  List<String>? scriptArgs;
  bool? sendImages;
  bool? saveImages;

  Text2ImageModel({
    this.prompt,
    this.negativePrompt,
    this.styles,
    this.seed,
    this.subseed,
    this.subseedStrength,
    this.seedResizeFromH,
    this.seedResizeFromW,
    this.samplerName,
    this.batchSize,
    this.nIter,
    this.steps,
    this.cfgScale,
    this.width,
    this.height,
    this.restoreFaces,
    this.tiling,
    this.doNotSaveSamples,
    this.doNotSaveGrid,
    this.eta,
    this.denoisingStrength,
    this.sMinUncond,
    this.sChurn,
    this.sTmax,
    this.sTmin,
    this.sNoise,
    this.overrideSettingsRestoreAfterwards,
    this.refinerCheckpoint,
    this.refinerSwitchAt,
    this.disableExtraNetworks,
    this.enableHr,
    this.firstphaseWidth,
    this.firstphaseHeight,
    this.hrScale,
    this.hrUpscaler,
    this.hrSecondPassSteps,
    this.hrResizeX,
    this.hrResizeY,
    this.hrCheckpointName,
    this.hrSamplerName,
    this.hrPrompt,
    this.hrNegativePrompt,
    this.samplerIndex,
    this.scriptName,
    this.scriptArgs,
    this.sendImages,
    this.saveImages,
  });

  @override
  Text2ImageModel fromJson(Map<String, dynamic> json) {
    return Text2ImageModel(
      prompt: json['prompt'],
      negativePrompt: json['negative_prompt'],
      styles: json['styles'].cast<String>(),
      seed: json['seed'],
      subseed: json['subseed'],
      subseedStrength: json['subseed_strength'],
      seedResizeFromH: json['seed_resize_from_h'],
      seedResizeFromW: json['seed_resize_from_w'],
      samplerName: json['sampler_name'],
      batchSize: json['batch_size'],
      nIter: json['n_iter'],
      steps: json['steps'],
      cfgScale: json['cfg_scale'],
      width: json['width'],
      height: json['height'],
      restoreFaces: json['restore_faces'],
      tiling: json['tiling'],
      doNotSaveSamples: json['do_not_save_samples'],
      doNotSaveGrid: json['do_not_save_grid'],
      eta: json['eta'],
      denoisingStrength: json['denoising_strength'],
      sMinUncond: json['s_min_uncond'],
      sChurn: json['s_churn'],
      sTmax: json['s_tmax'],
      sTmin: json['s_tmin'],
      sNoise: json['s_noise'],
      overrideSettingsRestoreAfterwards: json['override_settings_restore_afterwards'],
      refinerCheckpoint: json['refiner_checkpoint'],
      refinerSwitchAt: json['refiner_switch_at'],
      disableExtraNetworks: json['disable_extra_networks'],
      enableHr: json['enable_hr'],
      firstphaseWidth: json['firstphase_width'],
      firstphaseHeight: json['firstphase_height'],
      hrScale: json['hr_scale'],
      hrUpscaler: json['hr_upscaler'],
      hrSecondPassSteps: json['hr_second_pass_steps'],
      hrResizeX: json['hr_resize_x'],
      hrResizeY: json['hr_resize_y'],
      hrCheckpointName: json['hr_checkpoint_name'],
      hrSamplerName: json['hr_sampler_name'],
      hrPrompt: json['hr_prompt'],
      hrNegativePrompt: json['hr_negative_prompt'],
      samplerIndex: json['sampler_index'],
      scriptName: json['script_name'],
      sendImages: json['send_images'],
      saveImages: json['save_images'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prompt'] = prompt ?? '';
    if (negativePrompt != null) {
      data['negative_prompt'] = negativePrompt;
    }
    if (styles != null && styles!.isNotEmpty) {
      data['styles'] = styles;
    }
    if (seed != null) {
      data['seed'] = seed;
    }
    if (subseed != null) {
      data['subseed'] = subseed;
    }
    if (subseedStrength != null) {
      data['subseed_strength'] = subseedStrength;
    }
    if (seedResizeFromH != null) {
      data['seed_resize_from_h'] = seedResizeFromH;
    }
    if (seedResizeFromW != null) {
      data['seed_resize_from_w'] = seedResizeFromW;
    }
    if (samplerName != null) {
      data['sampler_name'] = samplerName;
    }
    data['batch_size'] = batchSize ?? 1;
    data['n_iter'] = nIter ?? 1;
    data['steps'] = steps ?? 50;
    data['cfg_scale'] = cfgScale ?? 7;
    data['width'] = width ?? 512;
    data['height'] = height ?? 512;
    data['restore_faces'] = restoreFaces ?? true;
    data['tiling'] = tiling ?? true;
    data['do_not_save_samples'] = doNotSaveSamples ?? false;
    data['do_not_save_grid'] = doNotSaveGrid ?? false;
    if (eta != null) {
      data['eta'] = eta;
    }
    if (denoisingStrength != null) {
      data['denoising_strength'] = denoisingStrength;
    }
    if (sMinUncond != null) {
      data['s_min_uncond'] = sMinUncond;
    }
    if (sChurn != null) {
      data['s_churn'] = sChurn;
    }
    if (sTmax != null) {
      data['s_tmax'] = sTmax;
    }
    if (sTmin != null) {
      data['s_tmin'] = sTmin;
    }
    if (sNoise != null) {
      data['s_noise'] = sNoise;
    }
    if (overrideSettingsRestoreAfterwards != null) {
      data['override_settings_restore_afterwards'] = overrideSettingsRestoreAfterwards;
    }
    if (refinerCheckpoint != null) {
      data['refiner_checkpoint'] = refinerCheckpoint;
    }
    if (refinerSwitchAt != null) {
      data['refiner_switch_at'] = refinerSwitchAt;
    }
    data['disable_extra_networks'] = disableExtraNetworks ?? false;
    if (enableHr != null) {
      data['enable_hr'] = enableHr;
    }
    if (firstphaseWidth != null) {
      data['firstphase_width'] = firstphaseWidth;
    }
    if (firstphaseHeight != null) {
      data['firstphase_height'] = firstphaseHeight;
    }
    if (hrScale != null) {
      data['hr_scale'] = hrScale;
    }
    if (hrUpscaler != null) {
      data['hr_upscaler'] = hrUpscaler;
    }
    if (hrSecondPassSteps != null) {
      data['hr_second_pass_steps'] = hrSecondPassSteps;
    }
    if (hrResizeX != null) {
      data['hr_resize_x'] = hrResizeX;
    }
    if (hrResizeY != null) {
      data['hr_resize_y'] = hrResizeY;
    }
    if (hrCheckpointName != null) {
      data['hr_checkpoint_name'] = hrCheckpointName;
    }
    if (hrSamplerName != null) {
      data['hr_sampler_name'] = hrSamplerName;
    }
    if (hrPrompt != null) {
      data['hr_prompt'] = hrPrompt;
    }
    if (hrNegativePrompt != null) {
      data['hr_negative_prompt'] = hrNegativePrompt;
    }
    if (samplerIndex != null) {
      data['sampler_index'] = samplerIndex;
    }
    if (scriptName != null) {
      data['script_name'] = scriptName;
    }
    if (scriptArgs != null) {
      data['script_args'] = scriptArgs;
    }
    data['send_images'] = sendImages ?? true;
    data['save_images'] = saveImages ?? false;
    return data;
  }
}
