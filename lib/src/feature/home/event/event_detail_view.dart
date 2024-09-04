import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/common/widget/button/category_tag.dart';
import 'package:space_app/src/service/model/astronomic_event_dto.dart';
import 'package:space_app/src/ui/space_ui.dart';

class EventDetailView extends StatefulWidget {
  final String? id;
  final String imageHeroTag;

  const EventDetailView({
    super.key,
    required this.id,
    required this.imageHeroTag,
  });

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  late AstronomicEventDTO? event;

  @override
  void initState() {
    final eventList = context.read<AstronomicEventBloc>().state.eventCache;
    event = eventList.firstWhere((element) => element.id == widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          previousPageTitle: 'Geri',
          middle: Text(
            'Gönderi',
          )),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      padding: PaddingConst.mediumPadding,
                      child: Hero(
                          tag: widget.imageHeroTag,
                          child: Container(
                            height: 200,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.bottomRight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  event?.image?.first ??
                                      'https://cdn.pixabay.com/photo/2019/04/06/06/44/astronaut-4106766_1280.jpg',
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CupertinoActivityIndicator(),
                                    );
                                  },
                                  errorBuilder:
                                      (context, exception, stackTrack) =>
                                          const Icon(
                                    Icons.error,
                                  ),
                                ).image,
                              ),
                            ),
                            child: event?.categories?.isNotEmpty == true
                                ? Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: [
                                    for (final String category
                                        in event!.categories!)
                                      CategoryTag(category: category),
                                  ],
                                )
                                : null,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                      children: [
                        Text(
                          event?.name ?? '',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(event?.description ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
