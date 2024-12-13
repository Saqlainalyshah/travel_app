import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/constant_widgets/app_color.dart';
import '../constant_widgets/list_items.dart';
import '../constant_widgets/widget_ui_components.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyAppColor.backgroundColor,
          actions: [
            ButtonWidget(
              color: Colors.white,
              width: 50.0,
              title: "Skip",
                onPress: () {
                  pageController.jumpToPage(OnBoardingItems.items.length - 1);
                },
            ),
          ],
        ),
        body: Container(
          color: MyAppColor.backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: OnBoardingItems.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = OnBoardingItems.items[index];
                    return Column(
                      children: [
                        OnBoardingContainer(
                          index: index,
                          imageUrl: item.imageUrl,
                          title: item.title,
                          subTitle: item.subtitle,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.01),
              SmoothPageIndicator(
                controller: pageController,
                count: OnBoardingItems.items.length,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 1.1,
                  activeDotColor: MyAppColor.buttonColor,
                  dotColor: Colors.grey,
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  spacing: 10.0,
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.06),
            ],
          ),
        ),
      ),
    );
  }
}
///onboarding container contains three values imagepath, title and a subtitle
class OnBoardingContainer extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final int index;

  const OnBoardingContainer({
    super.key,
    this.imageUrl,
    this.title,
    this.subTitle,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl.toString(),
            fit: BoxFit.fill,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          TextWidget(
            text: title.toString(),
            isBold: true,
            fontSize: 25,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          TextWidget(text: subTitle.toString()),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

          ///if index==3 we want to show more widgets at the bottom of this widget
          if(index==3)Column(
            children: [
              const PermissionCard(icon: Icons.location_on,title:"Location",subTitle: "Lorem ipsum dolor sit amet consectetur. Eu interdum sed pretium nulla neque purus velit quis massa."),
              const PermissionCard(icon: Icons.notifications,title:"Notifications",subTitle: "Lorem ipsum dolor sit amet consectetur. Eu interdum sed pretium nulla neque purus velit quis massa."),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
              ButtonWidget(onPress: (){},title: "Yes,sure!",color: MyAppColor.buttonColor,titleColor:Colors.white),
              ButtonWidget(onPress: (){},title: "Not now",color: MyAppColor.backgroundColor,),
            ],
          )
        ],
      ),
    );
  }
}
///Permission Card

class PermissionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const PermissionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: MyAppColor.buttonColor,
          size: 30.0,
        ),
        const SizedBox(width: 10), // Add spacing between the icon and the text
        Expanded( // Allow text to wrap within the available space
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
            children: [
              TextWidget(
                text: title,
                isBold: true,
                fontSize: 20.0,
              ),
              const SizedBox(height: 5), // Add spacing between title and subtitle
              TextWidget(
                text: subTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}