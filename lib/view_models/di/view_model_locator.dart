import 'package:flutter_mvvm/view_models/di/view_model_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final viewModelLocator = GetIt.instance;

@InjectableInit(
  generateForDir: ['lib/view_models'],
  initializerName: r'$initViewModelLocator', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureViewModelDependencies() =>
    $initViewModelLocator(viewModelLocator);
