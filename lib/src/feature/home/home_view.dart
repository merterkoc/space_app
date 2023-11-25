import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_app/src/base_scaffold.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/feature/home/component/home_app_bar.dart';
import 'package:space_app/src/feature/home/component/planet_card.dart';
import 'package:space_app/src/http/dio/model/request_state.dart';
import 'package:space_app/src/ui/space_ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context
        .read<AstronomicEventBloc>()
        .add(FetchAstronomicEvent(page: 1, size: 10));
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
              SizedBox(
                height: 300,
                child: BlocBuilder<AstronomicEventBloc, AstronomicEventState>(
                  buildWhen: (previous, current) =>
                      previous.events != current.events ||
                      previous.astronomicEventListRequestState !=
                          current.astronomicEventListRequestState,
                  builder: (context, state) {
                    switch (state.astronomicEventListRequestState) {
                      case RequestState.initialized:
                      case RequestState.loading:
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const PlanetCard(
                                imageUri: null,
                              );
                            },
                          ),
                        );
                      case RequestState.success:
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.events.length,
                          itemBuilder: (context, index) {
                            if (index < state.events.length) {
                              return PlanetCard(
                                imageUri: state.events[index].image?.first,
                                name: state.events[index].name ?? '',
                                description:
                                    state.events[index].description ?? '',
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        );
                      case RequestState.notInitialized:
                      case RequestState.error:
                        return const Center(
                          child: Text('Bir sorun oluştu lütfen tekrar deneyin'),
                        );
                    }
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
