import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/src/service/model/astronomic_event_dto.dart';
import 'package:space_app/src/ui/space_ui.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({
    super.key,
    this.event,
    required this.imageHeroTag,
  });

  final AstronomicEventDTO? event;
  final String imageHeroTag;

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu.builder(
      enableHapticFeedback: true,
      builder: (BuildContext context, Animation<double> animation) {
        return GestureDetector(
          onTap: () {
            animation.status == AnimationStatus.dismissed
                ? context
                    .pushNamed(AppRoute.eventDetailsView.name, pathParameters: {
                    'id': event!.sId!,
                    'imageHeroTag': imageHeroTag,
                  })
                : animation.status == AnimationStatus.completed
                    ? context.pop()
                    : null;
          },
          child: Card(
            event: event,
            animationStatus: animation.status,
            imageHeroTag: imageHeroTag,
          ),
        );
      },
      actions: [
        CupertinoContextMenuAction(
          trailingIcon: Icons.chevron_right_outlined,
          child: const Text('Details'),
          onPressed: () {
            context.pushNamed(AppRoute.eventDetailsView.name, pathParameters: {
              'id': event!.sId!,
              'imageHeroTag': imageHeroTag
            });
          },
        ),
        CupertinoContextMenuAction(
          isDestructiveAction: true,
          trailingIcon: Icons.report_problem_outlined,
          child: const Text('Report'),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.event,
    required this.animationStatus,
    required this.imageHeroTag,
  });

  final AstronomicEventDTO? event;
  final AnimationStatus animationStatus;
  final String imageHeroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).barBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Hero(
        tag: imageHeroTag,
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      event?.image?.first ??
                          'https://cdn.pixabay.com/photo/2019/04/06/06/44/astronaut-4106766_1280.jpg',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      },
                      errorBuilder: (context, exception, stackTrack) =>
                          const Icon(
                        Icons.error,
                      ),
                    ).image,
                  ),
                ),
              ),
            Text(
              event?.name ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Wrap(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2 days ago',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' 123 views',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (animationStatus == AnimationStatus.completed)
                  Text(
                    event?.description ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
