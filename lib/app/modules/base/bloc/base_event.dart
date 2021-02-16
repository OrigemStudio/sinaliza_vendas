import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum EventStatus { update }

class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class UpdatePage extends BlocEvent {
  final int indexPage;

  const UpdatePage({@required this.indexPage}) : assert(indexPage != null);

  @override
  List<Object> get props => [indexPage];
}

class UpdateSubPage extends BlocEvent {
  final int indexSubPage;

  const UpdateSubPage({@required this.indexSubPage})
      : assert(indexSubPage != null);

  @override
  List<Object> get props => [indexSubPage];
}
