import 'package:go_router/go_router.dart';
import 'package:space_app/src/base_scaffold.dart';
import 'package:space_app/src/feature/home/component/home_app_bar.dart';
import 'package:space_app/src/feature/home/component/planet_card.dart';
import 'package:space_app/src/ui/space_ui.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
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
    return ValueListenableBuilder<int>(
      valueListenable: currentIndexNotifier,
      builder: (context, value, child) {
        return BaseScaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndexNotifier.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              currentIndexNotifier.value = index;
              // switch (index) {
              //   case 0:
              //     context.go(AppRoute.onBoardingView.location);
              //     break;
              //   case 1:
              //     context.push(AppRoute.settingsView.location);
              //     break;
              //   case 2:
              //     context.push(AppRoute.homeView.location);
              // }
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SizedBox(
                    height: 20,
                    child: currentIndexNotifier.value == 0
                        ? Image.asset(
                            'lib/src/constant/images/space_icon_filled.png')
                        : Image.asset(
                            'lib/src/constant/images/space_icon.png')),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24,
                  child: currentIndexNotifier.value == 1
                      ? Image.asset(
                          'lib/src/constant/images/event_filled_icon.png')
                      : Image.asset('lib/src/constant/images/event_icon.png'),
                ),
                label: 'Space',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24,
                  child: currentIndexNotifier.value == 2
                      ? Image.asset(
                          'lib/src/constant/images/news_icon_filled.png')
                      : Image.asset('lib/src/constant/images/news_icon.png'),
                ),
                label: 'News',
              ),
            ],
          ),
          appBar: homeAppBar(context),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
      },
    );
  }
}
