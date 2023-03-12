import 'package:flutter/material.dart';
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
          TextButton(
            onPressed: () async {
              WeeOverlays.show(context);
              await Future.delayed(Duration(seconds: 3));
              WeeOverlays.hide(context);
            },
            child: Text('Default'),
          ),
          TextButton(
            onPressed: () async {
              WeeOverlays.show(
                context,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  color: Colors.grey[200],
                  child: Text("Wait ..."),
                ),
              );
              await Future.delayed(Duration(seconds: 3));
              WeeOverlays.hide(context);
            },
            child: Text('WeeOverlays'),
          )
        ],
      ),
    );
  }
}
