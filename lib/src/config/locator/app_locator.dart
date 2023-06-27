import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:trackbudi_vendor/src/config/router/app_router.dart';
import 'package:trackbudi_vendor/src/config/services/storage_service.dart';

GetIt locator = GetIt.instance;
Future setUpLocator() async {
  locator.registerSingleton<GoRouter>(router());
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
}
