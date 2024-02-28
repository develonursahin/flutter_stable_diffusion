import 'dart:typed_data';

import 'package:flutter_stable_diffusion/app/core/base/model/base_request_model.dart';

class Image2ImageModel extends BaseModel {
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
  double? denoisingStrength;
  int? sMinUncond;
  int? sChurn;
  int? sTmax;
  int? sTmin;
  int? sNoise;
  bool? overrideSettingsRestoreAfterwards;
  String? refinerCheckpoint;
  int? refinerSwitchAt;
  bool? disableExtraNetworks;
  List<String>? initImages;
  int? resizeMode;
  int? imageCfgScale;
  String? mask;
  int? maskBlurX;
  int? maskBlurY;
  int? maskBlur;
  int? inpaintingFill;
  bool? inpaintFullRes;
  int? inpaintFullResPadding;
  int? inpaintingMaskInvert;
  int? initialNoiseMultiplier;
  String? latentMask;
  String? samplerIndex;
  bool? includeInitImages;
  String? scriptName;
  bool? sendImages;
  bool? saveImages;

  Image2ImageModel({
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
    this.initImages,
    this.resizeMode,
    this.imageCfgScale,
    this.mask,
    this.maskBlurX,
    this.maskBlurY,
    this.maskBlur,
    this.inpaintingFill,
    this.inpaintFullRes,
    this.inpaintFullResPadding,
    this.inpaintingMaskInvert,
    this.initialNoiseMultiplier,
    this.latentMask,
    this.samplerIndex,
    this.includeInitImages,
    this.scriptName,
    this.sendImages,
    this.saveImages,
  });

  @override
  Image2ImageModel fromJson(Map<String, dynamic> json) {
    return Image2ImageModel(
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
      initImages: json['init_images'].cast<String>(),
      resizeMode: json['resize_mode'],
      imageCfgScale: json['image_cfg_scale'],
      mask: json['mask'],
      maskBlurX: json['mask_blur_x'],
      maskBlurY: json['mask_blur_y'],
      maskBlur: json['mask_blur'],
      inpaintingFill: json['inpainting_fill'],
      inpaintFullRes: json['inpaint_full_res'],
      inpaintFullResPadding: json['inpaint_full_res_padding'],
      inpaintingMaskInvert: json['inpainting_mask_invert'],
      initialNoiseMultiplier: json['initial_noise_multiplier'],
      latentMask: json['latent_mask'],
      samplerIndex: json['sampler_index'],
      includeInitImages: json['include_init_images'],
      scriptName: json['script_name'],
      sendImages: json['send_images'],
      saveImages: json['save_images'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prompt'] = prompt;
    data['negative_prompt'] = negativePrompt;
    data['styles'] = styles;
    data['seed'] = seed;
    data['subseed'] = subseed;
    data['subseed_strength'] = subseedStrength;
    data['seed_resize_from_h'] = seedResizeFromH;
    data['seed_resize_from_w'] = seedResizeFromW;
    data['sampler_name'] = samplerName;
    data['batch_size'] = batchSize;
    data['n_iter'] = nIter;
    data['steps'] = steps;
    data['cfg_scale'] = cfgScale;
    data['width'] = width;
    data['height'] = height;
    data['restore_faces'] = restoreFaces;
    data['tiling'] = tiling;
    data['do_not_save_samples'] = doNotSaveSamples;
    data['do_not_save_grid'] = doNotSaveGrid;
    data['eta'] = eta;
    data['denoising_strength'] = denoisingStrength;
    data['s_min_uncond'] = sMinUncond;
    data['s_churn'] = sChurn;
    data['s_tmax'] = sTmax;
    data['s_tmin'] = sTmin;
    data['s_noise'] = sNoise;
    data['override_settings_restore_afterwards'] = overrideSettingsRestoreAfterwards;
    data['refiner_checkpoint'] = refinerCheckpoint;
    data['refiner_switch_at'] = refinerSwitchAt;
    data['disable_extra_networks'] = disableExtraNetworks;
    data['init_images'] = initImages;
    data['resize_mode'] = resizeMode;
    data['image_cfg_scale'] = imageCfgScale;
    data['mask'] = mask;
    data['mask_blur_x'] = maskBlurX;
    data['mask_blur_y'] = maskBlurY;
    data['mask_blur'] = maskBlur;
    data['inpainting_fill'] = inpaintingFill;
    data['inpaint_full_res'] = inpaintFullRes;
    data['inpaint_full_res_padding'] = inpaintFullResPadding;
    data['inpainting_mask_invert'] = inpaintingMaskInvert;
    data['initial_noise_multiplier'] = initialNoiseMultiplier;
    data['latent_mask'] = latentMask;
    data['sampler_index'] = samplerIndex;
    data['include_init_images'] = includeInitImages;
    data['script_name'] = scriptName;
    data['send_images'] = sendImages;
    data['save_images'] = saveImages;
    return data;
  }
}
