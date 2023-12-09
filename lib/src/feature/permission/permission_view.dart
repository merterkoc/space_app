import 'package:space_app/src/base_scaffold.dart';
import 'package:space_app/src/handlers/location_handler.dart';
import 'package:space_app/src/ui/space_ui.dart';

class PermissionView extends StatelessWidget {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Permission',

              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  LocationHandler().openLocationSettings();
                },
                child: const Text(
                  'Check Permission',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
