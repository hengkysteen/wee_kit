import 'dart:developer';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeeLoadMore extends StatefulWidget {
  final bool showLog;
  final int length;
  final AsyncCallback onLoadMore;
  final IndexedWidgetBuilder builder;
  final RefreshCallback onRefresh;
  final bool showRefresh;
  final bool primary;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final Widget loadMore;
  final Visibility loadEnd;

  const WeeLoadMore({
    Key key,
    this.showLog = false,
    @required this.length,
    @required this.builder,
    this.onLoadMore,
    this.onRefresh,
    this.showRefresh = false,
    this.primary,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.loadMore,
    this.loadEnd,
  }) : super(key: key);

  @override
  _WeeLoadMoreState createState() => _WeeLoadMoreState();
}

class _WeeLoadMoreState extends State<WeeLoadMore> {
  bool _isLoadMore = false;
  bool _isBottom = false;

  Widget _widgetRefresh(Widget child) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: child,
    );
  }

  Widget _widgetList() {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification) {
              // Scroll Start
            } else if (scrollNotification is ScrollUpdateNotification) {
              // Scroll update
              if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent) {
                setState(() => _isBottom = true);
              } else {
                setState(() => _isBottom = false);
              }
            } else if (scrollNotification is ScrollEndNotification) {
              // Scroll end
              if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent) {
                if (!_isLoadMore && _isBottom) {
                  _loadMore();
                }
              }
            }

            return;
          },
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            primary: widget.primary,
            physics: widget.physics,
            itemCount: widget.length,
            itemBuilder: widget.builder,
          ),
        ),
        Visibility(
          visible: _isLoadMore && _isBottom,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              height: _isLoadMore && _isBottom ? 50 : 0,
              width: double.infinity,
              child: Center(
                child: widget.loadMore ??
                    Text(
                      "Load More ...",
                      style: TextStyle(color: Colors.grey),
                    ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _isBottom,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 50,
              width: double.infinity,
              child: Center(child: widget.loadEnd),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    if (widget.showRefresh) {
      return _widgetRefresh(_widgetList());
    }
    return _widgetList();
  }

  Future _loadMore() async {
    if (widget.showLog) {
      log("onLoadMore", name: "wee_kit");
    }
    if (widget.onLoadMore != null) {
      setState(() => _isLoadMore = true);
      await widget.onLoadMore();
      setState(() => _isLoadMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
