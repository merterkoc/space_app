import 'package:space_app/src/feature/home/component/more_even_list_widget.dart';
import 'package:space_app/src/ui/space_ui.dart';

class MoreEventView extends StatelessWidget {
  const MoreEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: 'Geri',
        middle: Text('More Event'),
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: SafeArea(
                bottom: false,
                child: SizedBox(height: 250, child: PaginationListViewMore())),
          ),
        ],
      ),
    );
  }
}
