import 'package:get_it/get_it.dart';

import '../services/api_drinks.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DrinksProxyService>(() => DrinksProxyService());
}