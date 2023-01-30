import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/buildpage.dart';
import 'choosepage.dart';
import 'constants/theme.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  String urlImage = '';
  String title = '';
  String subtitle = '';
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: const [
            BuildPage(
              urlImage: 'assets/images/3.png',
              title: 'مرحبا بك ',
              subtitle:
                  'هذه جولة تعريفية بأهم خدمات التطبيق لمساعدتك في الحصول على أكبر قدر من الفائدة',
            ),
            BuildPage(
              urlImage: 'assets/images/1.jpg',
              title: 'انضم معنا',
              subtitle:
                  'انضم معنا كي تصل الى العديد من الجمعيات الخيريةللحصول على المساعدة',
            ),
            BuildPage(
              urlImage: 'assets/images/1.jpg',
              title: 'اطلبها من بيتك',
              subtitle:
                  'يمكنك طلب المساعدات الخيرية ومتابعتها حتى تصل الى منزلك',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: () async {
                //navigate to choose page
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showChoose', true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Choose()),
                );
              },
              child: Text(' البدء الان',
                  textAlign: TextAlign.center,
                  style: titleTheme.copyWith(color: Colors.white)),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //skip
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: Text('تخطي',
                          style: subTitleTheme.copyWith(color: Colors.teal))),
                  //dots
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        spacing: 20,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal,
                      ),
                      //to click on dots and move
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      ),
                    ),
                  ),
                  //next
                  TextButton(
                      onPressed: () => controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          ),
                      child: Text('التالي',
                          style: subTitleTheme.copyWith(color: Colors.teal))),
                ],
              ),
            ),
    );
  }
}
