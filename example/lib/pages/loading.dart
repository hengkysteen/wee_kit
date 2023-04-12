import 'package:flutter/material.dart';
import 'package:wee_kit/loading.dart';
import 'package:wee_kit/wee_kit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeeLoading")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            onTap: () async {
              WeeLoading.showOverlay(context);
              await Future.delayed(Duration(seconds: 3));
              WeeNavigate.back(context);
            },
            title: Text('showOverlay'),
            subtitle: Text("disablePop: true"),
          ),
          ListTile(
            onTap: () async {
              WeeLoading.showOverlay(context, disablePop: false);
              await Future.delayed(Duration(seconds: 3));
              WeeNavigate.back(context);
            },
            title: Text('showOverlay'),
            subtitle: Text("disablePop: false"),
          ),
        ],
      ),
    );
  }
}
