import 'package:space_app/src/common/widget/animated_button.dart';
import 'package:space_app/src/ui/space_ui.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({
    super.key,
    this.imageUri,
    this.name,
    this.description,
  });

  final String? imageUri;
  final String? name;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return ClickableShrinkWidget(
      onTap: () {
        goRouter.pushNamed(AppRoute.eventDetailsView.name, extra: {
          'imageUri': imageUri,
          'name': name,
          'description': description,
        });
      },
      child: Container(
        width: 200,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              SpaceColors.purple,
              SpaceColors.pink,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (imageUri != null)
              Flexible(
                child: Padding(
                  padding: PaddingConst.smallPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://cdn.pixabay.com/photo/2019/04/06/06/44/astronaut-4106766_1280.jpg',
                          fit: BoxFit.cover,
                        ).image,
                      ),
                    ),
                  ),
                ),
              ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      strutStyle: const StrutStyle(height: 1.5),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
