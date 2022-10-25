import 'dart:async';

abstract class PageViewModel {
  FutureOr<void> init() {
    print('${this.runtimeType} init');
  }

  FutureOr<void> dispose() {
    print('${this.runtimeType} dispose');
  }
}
