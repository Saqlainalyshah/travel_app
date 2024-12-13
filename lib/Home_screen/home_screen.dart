import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/Home_screen/filter.dart';
import 'package:travel_app/constant_widgets/app_color.dart';
import 'package:travel_app/constant_widgets/custom_icons.dart';
import 'package:travel_app/constant_widgets/widget_ui_components.dart';

import '../constant_widgets/list_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _searchCon=TextEditingController();
  int mainIndex=0;

  int currentIndex=0;
  int activeIndex=0;
  final mainPageController=PageController();
  @override
  void dispose() {
    mainPageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyAppColor.backgroundColor,
        title: TextFieldWidget(
          isBorder: true,
          controller: _searchCon,
          leadingIcon: Icons.search,
          radius: 30,
          hintText: "Where to?",
          fillColor: Colors.white,),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyAppColor.textFieldColor,
                borderRadius: BorderRadius.circular(30)
              ),
                width: MediaQuery.sizeOf(context).width*0.15,
                height: MediaQuery.sizeOf(context).height*0.1,
                child: const Icon(CustomIcons.filter)),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child:  ListView.builder(
                // itemExtent: 9.0,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context,index){
                    return  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: OutLinedButton(
                        index: index,
                      pageIndex: mainIndex,
                      title: "Mansion",onPressed: (){
                        setState(() {
                          mainIndex=index;
                        });
                        },
                        leadingIcon: CustomIcons.world,
                      ),
                    );
                  }),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: PageView.builder(
                itemCount: screenList.length,
                onPageChanged: (index){
                  setState(() {
                    mainIndex=index;
                  });
                },

                controller: mainPageController,
                itemBuilder: (context,index){
                  return screenList[mainIndex];
                }),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        decoration: const BoxDecoration(
          color: MyAppColor.textFieldColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        height: MediaQuery.sizeOf(context).height * 0.15,
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: MyAppColor.textFieldColor,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyAppColor.buttonColor,
            unselectedItemColor: Colors.black38,
            elevation: 0.0,
            selectedIconTheme: const IconThemeData(
              size: 30
            ),
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Wishlist",
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: "My trip",
                icon: Icon(Icons.flight),// don't know the name of the icon
              ),
              BottomNavigationBarItem(
                label: "Account",
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),

    );
  }
}


List<Widget> screenList=[
const PageScreen1(),
  const Center(child: TextWidget(text: "Page2"),),
  const Center(child: TextWidget(text: "Page3"),),
  const Center(child: TextWidget(text: "Page4"),),
  const Center(child: TextWidget(text: "Page5"),),
  const Center(child: TextWidget(text: "Page6"),)
];

class PageScreen1 extends StatefulWidget {
  const PageScreen1({super.key});

  @override
  State<PageScreen1> createState() => _PageScreen1State();
}

class _PageScreen1State extends State<PageScreen1> {

  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            SizedBox(
              width:  double.infinity,
              height: height*(0.5-0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: "Awesome place for you!", isBold: true,fontSize: 20,),
                  const TextWidget(text: "There are many place that you can visit with your family",fontSize: 12,),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context,int index){
                          return const SliderCardWidget(

                              imageUrl: "assets/images/Rectangle31.png",
                              text: "Sun Royal Hotel Bali",
                              price: "\$40/Night");
                        }),
                  )
                ],
              ),
            ),
            ///
            Container(
              // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              color: Colors.white,
              width:  double.infinity,
              height: height*(0.3-0.04),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: "Big promo for your best holiday", isBold: true,fontSize: 20,),
                  const TextWidget(text: "Enjoy your holiday with our interesting promo!",fontSize: 12,),
                  const SizedBox(height: 20,),
                  ImageContainer(
                   isRadius: true,
                    imageUrl: "assets/images/yellowCard.png",
                    height: height*(0.2-0.04),
                    width: width*(0.9),
                    child: const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width:100,
                                    child: TextWidget(text: "Use promo code",isBold: true,fontSize: 14,color: Colors.white,)),
                                SizedBox(width:100,
                                    child: TextWidget(text: "to enjoy a 20% discount",isBold: true,fontSize: 14,color: Colors.white,))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width:150,
                                    child: TextWidget(text: "TRAVELFUN20",isBold: true,fontSize: 20,color: Colors.white,)),
                                SizedBox(width:80,
                                    child: TextWidget(text: "ON YOUR NEXT TRIP",isBold: true,fontSize: 14,color: Colors.white,))
                              ],
                            ),
                          ],
                        )
                    ),
                  ),

                ],
              ),
            ),

            Container(
              color: Colors.transparent,
              width:  double.infinity,
              height: height*(0.5-0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(text: "Another tour that you can enjoy", isBold: true,fontSize: 20,),
                  const TextWidget(text: "We have a bunch of tours that really makes you happy",fontSize: 12,),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context,int index){
                          return const SliderCardWidget(
                              imageUrl: "assets/images/Rectangle31.png",
                              text: "Sun Royal Hotel Bali",
                              price: "\$40/Night");
                        }),
                  )
                ],
              ),
            ),
            ///
            Container(
              height: height*0.5,
              color: MyAppColor.textFieldColor,
              padding: const EdgeInsets.all(10),
              child: PageView.builder(
                  itemCount: InformationArticles.informationArticlesList.length,
                  controller: pageController,
                  itemBuilder: (BuildContext context, int index){
                    final item=InformationArticles.informationArticlesList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: "Information articles for you",isBold: true,fontSize: 20,),
                        const TextWidget(text: "Lorem ipsum dolor sit amet consectetur. Eu interdum sed",fontSize: 12,),
                        const SizedBox(height: 10,),
                        ImageContainer(
                         isRadius: true,
                          height: height*0.3,imageUrl: item.imageUrl,),
                        TextWidget(text: item.text.toString(),
                          isBold: true,fontSize: 20,
                        ),
                        SizedBox(height: height*0.03,),
                        Center(
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: InformationArticles.informationArticlesList.length,
                            effect: const ExpandingDotsEffect(
                              expansionFactor: 1.1,
                              activeDotColor: MyAppColor.buttonColor,
                              dotColor: Colors.grey,
                              dotHeight: 8.0,
                              dotWidth: 8.0,
                              spacing: 8.0,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
