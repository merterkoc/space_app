import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/common/page_indicator_widget/page_indicator_state_widget.dart';
import 'package:space_app/src/feature/home/component/planet_card.dart';
import 'package:space_app/src/service/model/astronomic_event_dto.dart';
import 'package:space_app/src/ui/space_ui.dart';

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
            itemBuilder: (context, item, index) => PlanetCard(event: item),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

