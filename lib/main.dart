import 'package:space_app/app.dart';
import 'package:space_app/src/feature/settings/settings_controller.dart';
import 'package:space_app/src/feature/settings/settings_service.dart';
import 'package:space_app/src/ui/space_ui.dart';
final settingsController = SettingsController(SettingsService());

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();
  runApp(const SpaceApp());
}
