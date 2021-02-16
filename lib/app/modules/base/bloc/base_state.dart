import 'package:flutter/material.dart';

class BaseState {
  final int indexPage;
  final int indexSubPage;

  const BaseState({@required this.indexSubPage, @required this.indexPage})
      : assert(indexSubPage != null, indexPage != null);
}
