part of 'onboarding.dart';

class _WeeOnboardingIndicator extends StatelessWidget {
  final int length;
  final int? currentPage;
  final Color color;
  const _WeeOnboardingIndicator({Key? key, this.currentPage, required this.length, required this.color}) : super(key: key);

  Widget _dot() {
    return CircleAvatar(
      radius: 4,
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _line() {
    return Container(
      height: 7,
      width: 30,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(margin: const EdgeInsets.symmetric(horizontal: 2), child: currentPage == index ? _line() : _dot()),
      ),
    );
  }
}
