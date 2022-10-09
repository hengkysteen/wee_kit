import 'package:example/pages/color.dart';
import 'package:flutter/material.dart';
import 'package:wee_kit/wee_kit.dart';

import 'loadmore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("wee_kit"),),
      body: ListView(
        children: [
          ListTile(
            title: const Text("WeeColor"),
            subtitle: const Text("Color  & MaterialColor"),
            onTap: () => WeeNavigate.to(context, const ColorPage()),
          ),
          ListTile(
            title: const Text("WeeLoadMoreList"),
            subtitle: const Text("ListView , Loadmore & Refresh"),
            onTap: () => WeeNavigate.to(context, const LoadMorePage()),
          )
        ],
      ),
    );
  }
}
