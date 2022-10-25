import 'package:flutter/material.dart';

import '../../view_models/base/page_view_model.dart';
import '../../view_models/di/view_model_locator.dart';

class PageWidget<T extends PageViewModel> extends StatefulWidget {
  PageWidget({Key? key}) : super(key: key);

  final vm = viewModelLocator.get<T>();

  @override
  State<PageWidget> createState() => PageWidgetState();
}

class PageWidgetState<T extends PageViewModel> extends State<PageWidget<T>> {
  T get vm => widget.vm;

  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }
}
