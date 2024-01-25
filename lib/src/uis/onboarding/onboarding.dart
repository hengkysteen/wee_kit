import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wee_kit/wee_kit.dart';
part 'indicator.dart';

class WeeOnboardingScreen extends StatefulWidget {
  final List<WeeOnboardingItem> items;
  final VoidCallback? onEnd;
  final VoidCallback? onSkip;
  final Color? color;
  final Color? backgroundColor;
  const WeeOnboardingScreen({
    Key? key,
    required this.items,
    this.onEnd,
    this.onSkip,
    this.color,
    this.backgroundColor,
  })  : assert(items.length >= 2),
        super(key: key);

  @override
  State<WeeOnboardingScreen> createState() => _WeeOnboardingScreenState();
}

class _WeeOnboardingScreenState extends State<WeeOnboardingScreen> {
  PageController ctrl = PageController();
  int _currentPage = 0;

  void _onGetStarted() async {
    int page = _currentPage + 1;
    if (page == (widget.items.length)) {
      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    } else {
      await ctrl.animateToPage((page), duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  Widget pageItem(WeeOnboardingItem item, int i) {
    return wrapper(
      top: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            flex: 2,
            child: item.image == null ? const SizedBox() : Container(padding: EdgeInsets.all(20), child: item.image),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.title!,
                    textScaleFactor: 1.0,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.subtitle!,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
 
 
      bottom: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height / 5 - 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Visibility(
              visible: (i + 1) < widget.items.length,
              child: Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: widget.color != null ? WeeColor.shadeColor(widget.color!, 20) : WeeColor.shadeColor(Theme.of(context).primaryColor, 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Skip",
                    style: TextStyle(fontWeight: FontWeight.bold, color: widget.color),
                    textScaleFactor: 1.0,
                  ),
                  onPressed: widget.onSkip ?? () {},
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 0,
                  backgroundColor: widget.color,
                ),
                onPressed: _onGetStarted,
                child: Text((i + 1) == widget.items.length ? "Get Started" : "Next", textScaleFactor: 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget wrapper({Widget top = const SizedBox(), Widget center = const SizedBox(), Widget bottom = const SizedBox()}) {
    return Column(
      children: [
        Expanded(flex: 3, child: top),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 1, child: center),
              Expanded(flex: 2, child: Container(alignment: Alignment.topCenter, child: bottom)),
            ],
          ),
        ),
      ],
    );
  }

  Widget indicator() {
    return wrapper(
      center: _WeeOnboardingIndicator(
        color: widget.color ?? Theme.of(context).primaryColor,
        currentPage: _currentPage,
        length: widget.items.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor ?? Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            PageView(
              physics: const BouncingScrollPhysics(),
              pageSnapping: true,
              controller: ctrl,
              children: List.generate(widget.items.length, (index) => pageItem(widget.items[index], index)),
              onPageChanged: (val) => setState(() => _currentPage = val),
            ),
            indicator(),
            // INDICATOR
          ],
        )

        // body: Stack(
        //   children: [
        //     PageView(
        //       physics: const BouncingScrollPhysics(),
        //       pageSnapping: true,
        //       controller: ctrl,
        //       children: List.generate(
        //         widget.items.length,
        //         (i) {
        //           return Column(
        //             crossAxisAlignment: CrossAxisAlignment.stretch,
        //             children: [
        //               WeeOnboardingItem(
        //                 imageNetwork: widget.items[i].imageNetwork,
        //                 title: widget.items[i].title,
        //                 subtitle: widget.items[i].subtitle,
        //                 image: widget.items[i].image,
        //               ),
        //               Container(
        //                 padding: const EdgeInsets.all(20),
        //                 height: MediaQuery.of(context).size.height / 5 - 30,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                   children: [
        //                     Visibility(
        //                       visible: (i + 1) < widget.items.length,
        //                       child: Expanded(
        //                         child: TextButton(
        //                           style: TextButton.styleFrom(
        //                             backgroundColor: widget.color != null
        //                                 ? WeeColor.shadeColor(widget.color!, 20)
        //                                 : WeeColor.shadeColor(
        //                                     Theme.of(context).primaryColor,
        //                                     30
        //                                   ),
        //                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //                           ),
        //                           child: Text(
        //                             "Skip",
        //                             style: TextStyle(fontWeight: FontWeight.bold, color: widget.color),
        //                             textScaleFactor: 1.0,
        //                           ),
        //                           onPressed: widget.onSkip ?? () {},
        //                         ),
        //                       ),
        //                     ),
        //                     const SizedBox(width: 10),
        //                     Expanded(
        //                       child: ElevatedButton(
        //                         style: ElevatedButton.styleFrom(
        //                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //                           elevation: 0,
        //                           backgroundColor: widget.color,
        //                         ),
        //                         onPressed: _onGetStarted,
        //                         child: Text((i + 1) == widget.items.length ? "Get Started" : "Next", textScaleFactor: 1.0),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           );
        //         },
        //       ),
        //       onPageChanged: (val) => setState(() => _currentPage = val),
        //     ),
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Container(
        //         alignment: Alignment.topCenter,
        //         height: MediaQuery.of(context).size.height / 5,
        //         child: _WeeOnboardingIndicator(
        //           color: widget.color ?? Theme.of(context).primaryColor,
        //           currentPage: _currentPage,
        //           length: widget.items.length,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
