import 'package:space_app/app.dart';
import 'package:space_app/app_initialize.dart';
import 'package:space_app/src/feature/settings/settings_controller.dart';
import 'package:space_app/src/feature/settings/settings_service.dart';
import 'package:space_app/src/ui/space_ui.dart';
final settingsController = SettingsController(SettingsService());

Future<void> main() async {
  AppInitializationService.initialize();
  runApp(const SpaceApp());
}
