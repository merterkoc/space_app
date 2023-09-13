import 'package:go_router/go_router.dart';
import 'package:space_app/src/base_scaffold.dart';
import 'package:space_app/src/feature/home/component/home_app_bar.dart';
import 'package:space_app/src/feature/home/component/planet_card.dart';
import 'package:space_app/src/ui/space_ui.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppRoute.onBoardingView.location);
              break;
            case 1:
              context.push(AppRoute.settingsView.location);
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.search)),
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
  }
}
