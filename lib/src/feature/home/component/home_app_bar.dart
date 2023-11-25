import 'package:space_app/src/ui/space_ui.dart';

AppBar homeAppBar(BuildContext context) => AppBar(
      toolbarHeight: 100,
      centerTitle: false,
      backgroundColor: SpaceColors.purple,
      actions: [
        Padding(
          padding: PaddingConst.smallPadding,
          child: CircleAvatar(
            backgroundColor: SpaceColors.white,
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: SpaceColors.purple,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let\'s explore',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: SpaceColors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'The milky way galaxy',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: SpaceColors.white,
                ),
          ),
        ],
      ),
    );
