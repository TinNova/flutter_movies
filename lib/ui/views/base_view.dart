import 'package:flutter/cupertino.dart';
import 'package:movies/app/locator.dart';
import 'package:movies/ui/views/base_viewmodel.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onViewModelCreated;

  BaseView({required this.builder, required this.onViewModelCreated});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T viewModel = locator<T>();

  @override
  void initState() {
    widget.onViewModelCreated(viewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
