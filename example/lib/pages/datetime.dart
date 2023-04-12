import 'package:flutter/material.dart';
import 'package:wee_kit/wee_kit.dart';

class WeeDateTimeExamplePage extends StatefulWidget {
  const WeeDateTimeExamplePage({Key? key}) : super(key: key);

  @override
  State<WeeDateTimeExamplePage> createState() => _WeeDateTimeExamplePageState();
}

class _WeeDateTimeExamplePageState extends State<WeeDateTimeExamplePage> {
  DateTime now = DateTime.now();
  DateTime get nowSub => now.subtract(Duration(minutes: 23));

  Widget keyval(Widget key, Widget val) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [key, val],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeeDateTime")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            keyval(
              Text("DateTime now = DateTime.now()"),
              Text(now.toString()),
            ),
            keyval(
              Text("WeeDateTime.dateToString(now)"),
              Text(WeeDateTime.dateToString(now)),
            ),
            keyval(
              Text("WeeDateTime.dateToString(now, 'dd MMM yy')"),
              Text(WeeDateTime.dateToString(now, 'dd MMM yy')),
            ),
            keyval(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text("DateTime get nowSub => now.subtract(Duration(minutes: 23));"),
                  Text('WeeDateTime.toTimeAgo(nowSub)'),
                ],
              ),
              Text(WeeDateTime.toTimeAgo(nowSub)),
            ),
          ],
        ),
      ),
    );
  }
}
