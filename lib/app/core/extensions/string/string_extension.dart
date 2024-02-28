import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalizeEachWord() {
    return split(' ')
        .map((word) =>
            word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}' : word)
        .join(' ');
  }
}

extension ImagesExtension on String {
  Widget get toImage => Image.asset(
        this,
        fit: BoxFit.fill,
      );
  AssetImage get toImageProvider => AssetImage(this);
}
