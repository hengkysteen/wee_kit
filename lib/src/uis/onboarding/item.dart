import 'package:flutter/material.dart';

class WeeOnboardingItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imageNetwork;
  final Widget? image;
  const WeeOnboardingItem({Key? key, this.title, this.subtitle, this.imageNetwork, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 40),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2 - 50,
          child: image == null
              ? const SizedBox()
              : Container(
                  margin: EdgeInsets.all(30),
                  child: image,
                  color: Colors.red,
                ),

          // child: imageNetwork == null
          //     ? const SizedBox()
          //     : Container(
          //         margin: EdgeInsets.all(30),
          //         child: Image.network(imageNetwork!, height: 100, width: 100, fit: BoxFit.cover),
          //       ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title!,
                textScaleFactor: 1.0,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
