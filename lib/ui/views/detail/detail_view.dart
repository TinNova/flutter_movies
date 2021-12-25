import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/navigation_models.dart';
import 'package:movies/ui/views/base_view.dart';
import 'package:movies/ui/views/detail/detail_appbar.dart';
import 'package:movies/ui/views/detail/detail_body.dart';
import 'package:movies/ui/views/detail/detail_viewmodel.dart';
import 'package:movies/ui/views/detail/review_item.dart';

class DetailView extends StatefulWidget {
  static const String id = 'detail_view';

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MainToDetailArgs;
    return BaseView<DetailViewModel>(
      onViewModelCreated: (viewModel) {
        viewModel.onViewCreated(args.movieId);
      },
      builder: (context, viewModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: DetailAppBar(viewModel),
            ),
            SliverToBoxAdapter(
              child: (viewModel.detail.actors.isNotEmpty)
                  ? DetailBody(viewModel)
                  : Center(child: CircularProgressIndicator()),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: (viewModel.detail.reviews.isNotEmpty)
                      ? ReviewItem(viewModel.detail.reviews[index])
                      : Center(child: CircularProgressIndicator()),
                ),
                childCount: viewModel.getIndexOfChildren(viewModel.detail.reviews.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
