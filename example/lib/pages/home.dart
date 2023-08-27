import 'package:flutter/material.dart';
import 'package:wee_kit/wee_kit.dart';

import 'color.dart';
import 'datetime.dart';
import 'formater.dart';
import 'loading.dart';
import 'loadmore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("wee_kit example"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("WeeColor"),
            subtitle: const Text("Color  & MaterialColor"),
            onTap: () => WeeNavigate.to(context, const ColorPage()),
          ),
          ListTile(
            title: const Text("WeeLoadMoreList"),
            subtitle: const Text("ListView , Loadmore & Refresh"),
            onTap: () => WeeNavigate.to(context, const LoadMorePage()),
          ),
          ListTile(
            title: const Text("WeeTextInputFormaterCurrency"),
            subtitle: const Text("Currency"),
            onTap: () => WeeNavigate.to(context, const FormaterPage()),
          ),
          ListTile(
            title: const Text("WeeLoading"),
            subtitle: const Text("Overlay"),
            onTap: () => WeeNavigate.to(context, const LoadingPage()),
          ),
          ListTile(
            title: const Text("WeeDateTime"),
            subtitle: const Text("Overlay"),
            onTap: () => WeeNavigate.to(context, const WeeDateTimeExamplePage()),
          )
        ],
      ),
    );
  }
}