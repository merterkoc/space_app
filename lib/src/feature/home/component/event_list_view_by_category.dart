import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/common/page_indicator_widget/page_indicator_state_widget.dart';
import 'package:space_app/src/feature/home/component/planet_card.dart';
import 'package:space_app/src/service/model/astronomic_event_dto.dart';
import 'package:space_app/src/ui/space_ui.dart';

class EventListByCategory extends StatefulWidget {
  const EventListByCategory({super.key});

  @override
  State<EventListByCategory> createState() => _EventListByCategoryState();
}

class _EventListByCategoryState extends State<EventListByCategory> {
  static const _pageSize = 4;
  int currentPage = 1;

  final PagingController<int, AstronomicEventDTO> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
          (pageKey) {
        context.read<AstronomicEventBloc>().add(
          FetchAstronomicEventByCategory(
            page: pageKey,
            size: _pageSize,
            category:
            context
                .read<AstronomicEventBloc>()
                .state
                .selectedCategory,
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      MultiBlocListener(
          listeners: [
            BlocListener<AstronomicEventBloc, AstronomicEventState>(
              listenWhen: (previous, current) =>
              previous.selectedCategory != current.selectedCategory ||
                  previous.selectedCategoryIndex !=
                      current.selectedCategoryIndex,
              listener: (context, state) {
                _pagingController.itemList = [];
                currentPage = 1;
                _pagingController.refresh();
              },
            ),
            BlocListener<AstronomicEventBloc, AstronomicEventState>(
              listenWhen: (previous, current) =>
              previous.eventListByCategoryRequestState !=
                  current.eventListByCategoryRequestState,
              listener: (context, state) {
                if (state.eventListByCategoryRequestState.isSuccess) {
                  currentPage = currentPage + 1;
                  final isLastPage = state.eventsByCategory.length < _pageSize;
                  if (isLastPage) {
                    _pagingController.appendLastPage(state.eventsByCategory);
                  } else {
                    final nextPageKey = currentPage;
                    _pagingController.appendPage(
                        state.eventsByCategory, nextPageKey);
                  }
                } else if (state.eventListByCategoryRequestState.isError) {
                  _pagingController.error =
                      state.eventListByCategoryRequestState;
                } else if (state.eventListByCategoryRequestState.isLoading) {
                  //_pagingController.refresh();
                }
              },
            ),
          ],
          child: PagedListView<int, AstronomicEventDTO>(
            scrollDirection: Axis.horizontal,
            pagingController: _pagingController,
            itemExtent: 200,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            builderDelegate: PagedChildBuilderDelegate<AstronomicEventDTO>(
              firstPageProgressIndicatorBuilder: (context) =>
              const CupertinoActivityIndicator(),
              firstPageErrorIndicatorBuilder: (context) =>
                  PageIndicatorError(onRetry: _pagingController.refresh),
              animateTransitions: true,
              newPageProgressIndicatorBuilder: (context) =>
              const PageIndicatorLoading(),
              newPageErrorIndicatorBuilder: (context) =>
                  PageIndicatorError(onRetry: _pagingController.refresh),
              noItemsFoundIndicatorBuilder: (context) =>
                  PageIndicatorNotFound(onRetry: _pagingController.refresh),
              itemBuilder: (context, item, index) =>
                  PlanetCard(event: item, imageHeroTag: 'event_list_by_category${item.sId}'),
                  ),
            ),
          );

          @override
          void dispose()

  {

  _pagingController.dispose();

  super

      .

  dispose();
}}
