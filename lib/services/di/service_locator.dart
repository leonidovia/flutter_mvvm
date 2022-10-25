import 'package:flutter_mvvm/services/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  generateForDir: ['lib/services'],
  initializerName: r'$initServiceLocator', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureServiceDependencies() => $initServiceLocator(serviceLocator);
