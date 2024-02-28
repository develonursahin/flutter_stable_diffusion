enum ServicePath {
  options,
  sdModels,
  txt2img,
  img2img,
}

extension ServicePathExtension on ServicePath {
  String get subUrl {
    switch (this) {
      case ServicePath.options:
        return 'options';
      case ServicePath.sdModels:
        return 'sd-models';
      case ServicePath.txt2img:
        return 'txt2img';
      case ServicePath.img2img:
        return 'img2img';
    }
  }
}
