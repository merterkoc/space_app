import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';
import 'package:space_app/main.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/bloc/user_bloc/user_bloc.dart';
import 'package:space_app/src/feature/home/component/event_list_view.dart';
import 'package:space_app/src/feature/home/component/event_list_view_by_category.dart';
import 'package:space_app/src/ui/component/button/small_button.dart';
import 'package:space_app/src/ui/space_ui.dart';
import 'package:space_app/src/ui/widgets/small_button_list.dart';
import 'package:space_app/src/util/date_util/date_time.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    context.read<AstronomicEventBloc>().add(FetchEventCategories());
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    settingsController.listenToThemeMode();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoPageScaffold(
      backgroundColor: brightness == Brightness.light
          ? CupertinoColors.white
          : CupertinoColors.black,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text(
              'Let\'s explore',
            ),
            previousPageTitle: 'Home',
            stretch: true,
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(0),
              child: const ProfileIcon(),
              onPressed: () => context.pushNamed(AppRoute.profileView.name),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 12, right: 16),
                  child: Text(
                    DateTimeUtil.formatDateTimeToCustomString(DateTime.now()),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(height: 250, child: PaginationListView()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<AstronomicEventBloc, AstronomicEventState>(
                    buildWhen: (previous, current) =>
                        previous.eventCategories != current.eventCategories ||
                        previous.selectedCategoryIndex !=
                            current.selectedCategoryIndex,
                    builder: (context, state) {
                      if (state.eventCategories.isEmpty) {
                        return const SizedBox(height: 70);
                      }
                      final List<SmallButtonItem> smallButtonItems =
                          state.eventCategories.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final String category = entry.value;
                        return SmallButtonItem(
                          isActive: index == state.selectedCategoryIndex,
                          callback: () {
                            context
                                .read<AstronomicEventBloc>()
                                .add(SelectEventCategory(categoryIndex: index));
                          },
                          text: ReCase(category).titleCase,
                        );
                      }).toList();
                      return SmallButtonItemList(
                        smallButtonItems: smallButtonItems,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 2, right: 16),
                  child: Text(
                    ReCase(context
                                .watch<AstronomicEventBloc>()
                                .state
                                .selectedCategory ??
                            '')
                        .titleCase,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                const SizedBox(height: 250, child: EventListByCategory()),
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallButton(
                        smallButtonItems: SmallButtonItem(
                            icon: CupertinoIcons.right_chevron,
                            isActive: false,
                            callback: () {
                              context.goNamed(AppRoute.moreEventsView.name);
                            },
                            text: 'More events'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    if (!context.watch<AuthenticationBloc>().state.status.isAuthenticated) {
      return const Icon(
        CupertinoIcons.person_crop_circle_fill,
        color: CupertinoColors.systemGrey,
        size: 40,
      );
    } else {
      return ClipOval(
      child: Image.network('https://pbs.twimg.com/profile_images/1800536047031369728/EG33Eq8-_400x400.jpg'));
    }
  }
}
