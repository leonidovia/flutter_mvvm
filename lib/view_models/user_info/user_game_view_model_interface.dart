import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_models/base/page_view_model.dart';

abstract class IUserGameViewModel extends PageViewModel {
  String get name;
  String get lastName;
  ValueNotifier<int> get moneyVN;
  ValueNotifier<bool> get isLoading;

  Future<void> play();
}