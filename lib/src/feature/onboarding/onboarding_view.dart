import 'package:go_router/go_router.dart';
import 'package:space_app/router.dart';
import 'package:space_app/src/base_scaffold.dart';
import 'package:space_app/src/constant/padding_const.dart';
import 'package:space_app/src/ui/component/button/button.dart';
import 'package:space_app/src/ui/space_ui.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2020/10/21/15/31/planets-5673503_1280.png',
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                SpaceColors.transparent,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
          child: SafeArea(
            minimum: PaddingConst.mediumPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Text(
                  'Space',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: SpaceColors.white),
                ),
                const SizedBox(height: 16),
                Text('Explore the universe',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: SpaceColors.white)),
                const SizedBox(height: 16),
                Text('Learn about the universe and the planets',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: SpaceColors.white)),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: SpaceButton(
                      onPressed: () {
                        return context.go(AppRoute.homeView.path);
                      },
                      text: 'Get Started',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
