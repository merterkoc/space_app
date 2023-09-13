import 'package:space_app/src/ui/space_ui.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({
    super.key,
    required this.imageUri,
    required this.name,
    required this.description,
  });

  final String imageUri;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
           SpaceColors.purple,
            SpaceColors.pink  ,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: PaddingConst.smallPadding,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      imageUri,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
