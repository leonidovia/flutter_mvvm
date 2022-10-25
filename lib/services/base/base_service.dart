import 'dart:async';

abstract class BaseService {
  FutureOr<void> init() {}
  FutureOr<void> dispose() {}
}