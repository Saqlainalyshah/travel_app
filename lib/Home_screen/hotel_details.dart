import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/Home_screen/booking%20details.dart';
import 'package:travel_app/constant_widgets/custom_icons.dart';
import 'package:travel_app/constant_widgets/widget_ui_components.dart';

import '../constant_widgets/app_color.dart';

class HotelDetails extends StatefulWidget {
  const HotelDetails({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: PageView.builder(
                    controller: controller,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ImageContainer(
                          imageUrl: widget.imageUrl,
                          width: MediaQuery.sizeOf(context).width,
                          isRadius: false,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.arrow_back,
                                          )),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: GestureDetector(
                                          onTap: () {
                                            //Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.share,
                                          )),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: GestureDetector(
                                          onTap: () {
                                            //   Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.favorite_border,
                                          )),
                                    ),
                                  ],
                                ),
                                SmoothPageIndicator(
                                  controller: controller,
                                  count: 5,
                                  effect: const ExpandingDotsEffect(
                                    expansionFactor: 1.1,
                                    activeDotColor: MyAppColor.buttonColor,
                                    dotColor: Colors.grey,
                                    dotHeight: 10.0,
                                    dotWidth: 10.0,
                                    spacing: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
              Row(
                children: List.generate(
                  5, // Number of stars
                  (index) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 20.0,
                  ),
                ),
              ),
              const TextWidget(
                text: "Sun Royal Hotel Bali",
                fontSize: 20,
                isBold: true,
              ),
              const TextWidget(text: "Bali, Indonesia"),
              const OutlineButtonWidget(),
              const SizedBox(
                height: 10.0,
              ),
             lineWidget(),
              const SizedBox(
                height: 10.0,
              ),
              const TextWidget(
                text: "Facilities",
                isBold: true,
                fontSize: 20,
              ),
              const TextWidget(
                text:
                    "Lorem ipsum dolor sit amet consectetur.Eu interdum sed pretium nulla",
                fontSize: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowComponents(
                          firstIcon: CustomIcons.black_two_dots,
                          firstText: "Kitchen",
                        ),
                        RowComponents(
                          firstIcon: CustomIcons.wifi,
                          firstText: "Wifi",
                        ),
                        RowComponents(
                          firstIcon: CustomIcons.p,
                          firstText: "Free Parking",
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowComponents(
                          firstIcon: CustomIcons.swiming,
                          firstText: "Poll",
                        ),
                        RowComponents(
                          firstIcon: CustomIcons.arrow,
                          firstText: "AC",
                        ),
                        RowComponents(
                          firstIcon: CustomIcons.gem,
                          firstText: "Fitness Room",
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ButtonWidget(
                onPress: () {},
                title: "Show More",
              ),
              const SizedBox(
                height: 10.0,
              ),
              const TextWidget(
                text: "Location",
                isBold: true,
                fontSize: 20,
              ),
              const TextWidget(
                text:
                    "Lorem ipsum dolor sit amet consectetur. Eu interdum sed pretium nulla",
                fontSize: 12,
              ),
              const SizedBox(
                height: 100,
              ),
              const TextWidget(
                text: "What they said about us",
                isBold: true,
                fontSize: 20,
              ),
              const TextWidget(
                text:
                    "Lorem ipsum dolor sit amet consectetur. Eu interdum sed pretium nulla",
                fontSize: 12,
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 250,
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Border color
                            width: 1.5, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                        ), // Space inside the border
                        child: Column(
                          children: [
                            Row(
                              children: List.generate(
                                5, // Number of stars
                                (index) => const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8), // Add spacing
                            const TextWidget(
                              text:
                                  "Lorem ipsum dolor sit amet consectetur. Eu interdum sed pretium nulla neque purus velit quis massa.",
                              fontSize: 9,
                            ),
                            const SizedBox(height: 12), // Add spacing
                            ListTileWidget(
                              title: "Susan Cole",
                              subtitle: "Tokyo, Japan",
                              leadingWidget: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://thumbs.wbm.im/pw/small/39573f81d4d58261e5e1ed8f1ff890f6.jpg",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    text: "\$125/Night",
                    isBold: true,
                    fontSize: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: ButtonWidget(
                      onPress: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize:  MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16.0),
                                    width: double.infinity,
                                    //height: MediaQuery.sizeOf(context).height*0.8,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       const Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text(
                                             '1 room, 2 adults,2 nights',
                                             style: TextStyle(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                           Icon(Icons.edit)
                                         ],
                                       ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          height:340,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (context,index){
                                              return Container(
                                                width: 200,
                                                margin: const EdgeInsets.all(5.0),
                                                padding: const EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey, // Border color
                                                    width: 1.5, // Border width
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(8), // Rounded corners
                                                ), // Space inside the border
                                                child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const TextWidget(text: "Standard Deluxe",isBold: true,fontSize: 20,),
                                                        const SizedBox(height: 8), // Add spacing
                                                        const RowComponents(firstIcon: CustomIcons.store,firstText: "2 Breakfasts",),
                                                        const RowComponents(firstIcon: Icons.check_circle,firstText: "Instan confirmation",),
                                                        const RowComponents(firstIcon: CustomIcons.arrow_left,firstText: "Refundable",),
                                                        const RowComponents(firstIcon: CustomIcons.car,firstText: "1 King-Size bed",),
                                                        const RowComponents(firstIcon: CustomIcons.wifi,firstText: "Free wifi",),
                                                        const SizedBox(height: 12),
                                                        const TextWidget(text: "\$225/Night",isBold: true,fontSize: 20,),
                                                        const TextWidget(text: "(exclude tax)",fontSize: 12,),
                                                        const SizedBox(height: 12),
                                                        ButtonWidget(onPress: (){
                                                          Navigator.of(context).pop();
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingDetailsScreen(imageUrl: widget.imageUrl,)));
                                                        },
                                                          title: "Select Room",
                                                        ),


                                                        const SizedBox(height: 12), // Add spacing
                                                      ],
                                                    ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      title: "Select room",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class RowComponents extends StatelessWidget {
  const RowComponents({
    super.key,
    required this.firstIcon,
    required this.firstText,
  });

  final IconData firstIcon;
  final String firstText;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          firstIcon,
          color: MyAppColor.buttonColor,
        ),
        const SizedBox(width: 10,),
        TextWidget(
          text: firstText,
          isBold: true,
        )
      ],
    );
  }
}

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const TextWidget(
                  text: "4.5",
                  isBold: true,
                ),
                Row(
                  children: List.generate(
                    5, // Number of stars
                    (index) => const Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 10.0,
                    ),
                  ),
                ),
              ],
            ),
            const TextWidget(
              text: "Very Good",
              isBold: true,
              fontSize: 15,
            ),
            const Column(
              children: [
                TextWidget(
                  text: "500",
                  isBold: true,
                ),
                TextWidget(
                  text: "Reviews",
                  isBold: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


Widget lineWidget(){
  return Container(
height: 1.0,
width: double.infinity,
color: Colors.grey,
);
}