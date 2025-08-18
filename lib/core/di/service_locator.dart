import 'package:get_it/get_it.dart';
import 'package:house_finder/core/config/routing/navigation_service.dart';

//provides centralized location for Service Locator so that it can be used everywhere in the app
final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  // locator.registerSingleton<NavigationService>(NavigationService());
}
