import 'package:flutter/material.dart';
import 'package:wee_kit/wee_kit.dart' show WeeColor;

class ColorPage extends StatelessWidget {
  const ColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeeColor")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            height: 60,
            color: WeeColor.duskMauve,
            child: const Center(
              child: Text(
                "WeeColor.duskMauve",
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 60,
            color: WeeColor.lavenderBlue,
            child: const Center(
              child: Text(
                "WeeColor.lavenderBlue",
              ),
            ),
          ),
          const SizedBox(height: 50),
          Theme(
            data: ThemeData(
              primarySwatch: WeeColor(WeeColor.duskMauve).toMaterialColor(),
            ),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                child: const Text("WeeColor(WeeColor.duskMauve).toMaterialColor()"),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 10),
          Theme(
            data: ThemeData(
              primarySwatch: WeeColor(const Color(0XFFB18F6C)).toMaterialColor(),
            ),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                child: const Text("WeeColor(Color(0XFFB18F6C)).toMaterialColor()"),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 10),
          Theme(
            data: ThemeData(
              primarySwatch: WeeColor(Colors.black).toMaterialColor(),
            ),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                child: const Text("WeeColor(Colors.black).toMaterialColor()"),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
