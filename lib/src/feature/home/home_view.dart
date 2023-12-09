import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:space_app/src/base_scaffold.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/feature/home/component/home_app_bar.dart';
import 'package:space_app/src/feature/home/component/planet_card.dart';
import 'package:space_app/src/service/model/astronomic_event_dto.dart';
import 'package:space_app/src/ui/space_ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<PlanetCard> planetCards = [
      const PlanetCard(
        imageUri:
            'https://cdn.pixabay.com/photo/2023/09/04/17/04/mars-8233226_1280.png',
        name: 'Planet',
        description: 'This is a planet',
      ),
      const PlanetCard(
        imageUri:
            'https://cdn.pixabay.com/photo/2023/09/04/17/04/mars-8233226_1280.png',
        name: 'Planet',
        description: 'This is a planet',
      ),
      const PlanetCard(
        imageUri:
            'https://cdn.pixabay.com/photo/2023/09/04/17/04/mars-8233226_1280.png',
        name: 'Planet',
        description: 'This is a planet',
      ),
    ];
    return BaseScaffold(
      appBar: homeAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 300,
                child: PaginationListView(),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: planetCards.length,
                  itemBuilder: (context, index) {
                    if (index < planetCards.length) {
                      return planetCards[index];
                    }
                    return Container();
                  },
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: planetCards.length,
                  itemBuilder: (context, index) {
                    if (index < planetCards.length) {
                      return planetCards[index];
                    }
                    return Container();
                  },
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: planetCards.length,
                  itemBuilder: (context, index) {
                    if (index < planetCards.length) {
                      return planetCards[index];
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginationListView extends StatefulWidget {
  const PaginationListView({super.key});

  @override
  State<PaginationListView> createState() => _PaginationListViewState();
}

class _PaginationListViewState extends State<PaginationListView> {
  static const _pageSize = 4;
  int currentPage = 2;

  final PagingController<int, AstronomicEventDTO> _pagingController =
      PagingController(firstPageKey: 2);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) {
        context.read<AstronomicEventBloc>().add(
              FetchAstronomicEvent(
                page: pageKey,
                size: _pageSize,
              ),
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      // Don't worry about displaying progress or error indicators on screen; the
      // package takes care of that. If you want to customize them, use the
      // [PagedChildBuilderDelegate] properties.
      BlocListener<AstronomicEventBloc, AstronomicEventState>(
        listenWhen: (previous, current) =>
            previous.astronomicEventListRequestState !=
            current.astronomicEventListRequestState,
        listener: (context, state) {
          if (state.astronomicEventListRequestState.isSuccess) {
            currentPage = currentPage + 1;
            final isLastPage = state.events.length < _pageSize;
            if (isLastPage) {
              _pagingController.appendLastPage(state.events);
            } else {
              final nextPageKey = currentPage;
              _pagingController.appendPage(state.events, nextPageKey);
            }
          } else if (state.astronomicEventListRequestState.isError) {
            _pagingController.error = state.astronomicEventListRequestState;
          } else if (state.astronomicEventListRequestState.isLoading) {
            //_pagingController.refresh();
          }
        },
        child: PagedListView<int, AstronomicEventDTO>(
          scrollDirection: Axis.horizontal,
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<AstronomicEventDTO>(
            itemBuilder: (context, item, index) => PlanetCard(
              imageUri: item.image?.first,
              name: item.name,
              description: item.description,
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
