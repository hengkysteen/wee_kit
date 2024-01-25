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
          ),
          ListTile(
            title: const Text("WeeOnboarding"),
            subtitle: const Text("Overlay"),
            onTap: () {
              WeeNavigate.to(
                context,
                WeeOnboardingScreen(
                  onEnd: () {
                    WeeNavigate.to(context, const HomePage(), removeUntil: true);
                  },
                  onSkip: () {
                    WeeNavigate.to(context, const HomePage(), removeUntil: true);
                  },
                  items: [
                    WeeOnboardingItem(
                      title: "Title One ",
                      subtitle:
                          "Veniam est eiusmod eiusmod incididunt irure qui magna laboris ipsum ipsum laboris anim consectetur. Sit commodo magna deserunt laborum labore cupidatat amet. Adipisicing aute qui consequat elit velit est esse irure. Pariatur consectetur quis nisi tempor duis deserunt ex mollit eiusmod minim reprehenderit consectetur dolore ut. Sunt ad laborum ut minim id. In magna in eiusmod ea Lorem dolor do nostrud do anim pariatur mollit. Labore irure ut dolore elit nisi id dolor occaecat sint.",
                      imageNetwork: "https://fastly.picsum.photos/id/380/536/354.jpg?hmac=V4ihBK1-m3vKhhttPe-PheLA3ZCuF8BcSnhIliQmzpE",
                      image: Image.asset("assets/onboarding-1.png"),
                    ),
                    WeeOnboardingItem(
                      title: "Title Two",
                      subtitle: "Sunt dolore aliquip veniam adipisicing cupidatat est non irure est duis esse in sunt.",
                      imageNetwork: "https://fastly.picsum.photos/id/618/536/354.jpg?hmac=jM17hhJ4HTjKdNWwxVkcDOM0nbGu_YQVAgpgf43p9wM",
                      image: Image.asset("assets/onboarding-2.png"),
                    ),
                    WeeOnboardingItem(
                      title: "Title Three",
                      subtitle:
                          "Laborum aliqua incididunt duis ea. Duis aute irure tempor adipisicing qui aliqua eiusmod ex proident. Do qui nisi excepteur dolor pariatur qui pariatur ad elit. Duis consequat voluptate Lorem ea eu id eiusmod deserunt in reprehenderit veniam consequat veniam tempor. Occaecat ipsum pariatur est veniam pariatur eiusmod elit excepteur et nulla et veniam nostrud. Mollit est adipisicing est proident anim.",
                      imageNetwork: "https://fastly.picsum.photos/id/594/536/354.jpg?hmac=51jzctSPRfmg0VV_LXPN_3Wgin9y6XMUA0NsnB7Yegw",
                      image: Image.asset("assets/onboarding-3.png"),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
