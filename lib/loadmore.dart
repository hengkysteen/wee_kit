import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeeLoadMoreList extends StatefulWidget {

  final int length;
  final IndexedWidgetBuilder builder;

  /// [onRefresh] require [showRefresh] to true
  final RefreshCallback? onRefresh;
  
  final bool showRefresh;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final AsyncCallback? onLoadMore;
  final Widget? loadMoreWidget;
  final Widget? loadMoreEndWidget;
  final bool isLoadMoreEnd;

  /// A ListView widget with Loadmore & refresh feature

  const WeeLoadMoreList({
    Key? key,
    required this.length,
    required this.builder,
    this.onLoadMore,
    this.onRefresh,
    this.showRefresh = false,
    this.primary,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.loadMoreWidget,
    this.loadMoreEndWidget,
    this.isLoadMoreEnd = false,
  })  : assert(showRefresh == true ? onRefresh != null : onRefresh == null),
        super(key: key);

  @override
  _WeeLoadMoreListState createState() => _WeeLoadMoreListState();
}

class _WeeLoadMoreListState extends State<WeeLoadMoreList> {
  bool _isLoadMore = false;
  bool _isBottom = false;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  bool Function(ScrollNotification)? get _onNotification {
    return (scrollNotification) {
      print(scrollNotification);
      if (scrollNotification is ScrollStartNotification) {
        // ScrollStartNotification
      } else if (scrollNotification is ScrollUpdateNotification) {
        //ScrollUpdateNotification
        if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent) {
          setState(() => _isBottom = true);
        } else {
          setState(() => _isBottom = false);
        }
      } else if (scrollNotification is ScrollEndNotification) {
        //ScrollEndNotification
        if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent) {
          if (!_isLoadMore && _isBottom) {
            _loadMore();
          }
        }
      }
      return true;
    };
  }

  Widget _widgetBody(Widget child) {
    return Stack(
      children: [
        Visibility(
          visible: widget.isLoadMoreEnd && !_isLoadMore && _isBottom,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 70,
              width: double.infinity,
              child: Center(child: widget.loadMoreEndWidget ?? Text("-- No More --", style: TextStyle(color: Colors.grey))),
            ),
          ),
        ),
        Visibility(
          visible: _isLoadMore && _isBottom,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              height: _isLoadMore && _isBottom ? 70 : 0,
              width: double.infinity,
              child: Center(child: widget.loadMoreWidget ?? Text("Load More ...", style: TextStyle(color: Colors.grey))),
            ),
          ),
        ),
        NotificationListener<ScrollNotification>(onNotification: _onNotification, child: child),
      ],
    );
  }

  Widget _list() {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 70),
      primary: widget.primary,
      physics: widget.physics,
      itemCount: widget.length,
      itemBuilder: widget.builder,
    );
  }

  // Widget _widgetRefresh(Widget child) {
  //   return RefreshIndicator(
  //     onRefresh: widget.onRefresh!,
  //     child: child,
  //   );
  // }

  Widget _buildBody() {
    if (widget.showRefresh) {
      return _widgetBody(RefreshIndicator(
        onRefresh: widget.onRefresh!,
        child: _list(),
      ));
    }
    return _widgetBody(_list());
  }

  Future<void> _loadMore() async {
    if (widget.onLoadMore != null) {
      setState(() => _isLoadMore = true);
      await widget.onLoadMore!();
      if (!mounted) return;
      setState(() => _isLoadMore = false);
    }
  }
}
