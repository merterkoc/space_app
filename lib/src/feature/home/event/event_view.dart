import 'package:space_app/src/ui/space_ui.dart';

class EventDetailView extends StatelessWidget {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  const EventDetailView({super.key, this.id, this.name, this.description, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Center(
          child: Text('EventDetailView'),
        ),
      ),
    );
  }
}
