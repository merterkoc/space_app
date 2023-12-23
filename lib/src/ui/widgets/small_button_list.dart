import 'package:space_app/src/ui/component/button/small_button.dart';
import 'package:space_app/src/ui/space_ui.dart';

final ScrollController scrollController = ScrollController();

class SmallButtonItemList extends StatelessWidget {
  const SmallButtonItemList({super.key, required this.smallButtonItems});

  final List<SmallButtonItems> smallButtonItems;

  @override
  Widget build(BuildContext context) {
    var firstWhere = smallButtonItems.firstWhere((element) => element.isActive);
    smallButtonItems.remove(firstWhere);
    smallButtonItems.insert(0, firstWhere);
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: smallButtonItems.length,
            itemBuilder: (context, index) =>
                SmallButton(smallButtonItems: smallButtonItems[index]),
          ),
        ),
      ],
    );
  }
}
