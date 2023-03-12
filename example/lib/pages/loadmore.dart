import 'package:flutter/material.dart';
import 'package:wee_kit/wee_kit.dart';

class LoadMorePage extends StatefulWidget {
  const LoadMorePage({Key? key}) : super(key: key);

  @override
  State<LoadMorePage> createState() => _LoadMorePageState();
}

class _LoadMorePageState extends State<LoadMorePage> {
  
  List data = [];
  bool isDataEnd = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData({bool isRefresh = false}) async {
    if (isRefresh) {
      setState(() {
        data.clear();
      });
    }
    if (data.length >= 30) {
      setState(() {
        isDataEnd = true;
      });
    } else {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      setState(() {
        data.addAll(List.generate(10, (index) => "Data"));
        isDataEnd = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeeLoadMoreList")),
      body: data.isEmpty
          ? Center(
              child: Text(
                "Load ..",
              ),
            )
          : WeeLoadMoreList(
              primary: true,
              isLoadMoreEnd: isDataEnd,
              showRefresh: true,
              onRefresh: () async => await getData(isRefresh: true),
              onLoadMore: getData,
              length: data.length,
              builder: (c, i) {
                return Card(
                  child: SizedBox(height: 100, child: Center(child: Text("${data[i]} ${i + 1}"))),
                );
              },
            ),
    );
  }
}
