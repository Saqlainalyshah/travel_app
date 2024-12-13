import 'package:flutter/material.dart';
import 'package:travel_app/Home_screen/home_screen.dart';
import 'package:travel_app/constant_widgets/app_color.dart';
import 'package:travel_app/constant_widgets/widget_ui_components.dart';
import 'hotel_details.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController totalGuests = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    //print(widget.imageUrl.toString());
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyAppColor.backgroundColor,
        title: const TextWidget(
          text: "Reservation",
          isBold: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                //height: 200,
                width: double.infinity,

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageContainer(
                        width: 150,
                        height: 150,
                        isRadius: true,
                        imageUrl: widget.imageUrl.toString()),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonWidget(
                            onPress: () {},
                            titleColor: MyAppColor.buttonColor,
                            width: 100,
                            height: 40,
                            fontSize: 12,
                            title: "Best Choice",
                            color: const Color(0xffe4edfd),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextWidget(text: "Sun Royal Hotel Bali"),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: List.generate(
                              6, // Number of elements (5 stars + 1 text widget)
                              (index) {
                                if (index == 5) {
                                  return const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: TextWidget(
                                      text: "(500)",
                                      isBold: true,
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  );
                                }
                                return const Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 15.0,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              lineWidget(),
              const SizedBox(
                height: 20,
              ),
              const TextWidget(
                text: "Select Dates",
                isBold: true,
                fontSize: 20,
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: MyAppColor.textFieldColor,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () async {
                    final DateTimeRange? pickedDateRange =
                        await showDateRangePicker(
                      context: context,
                      initialDateRange: startDate != null && endDate != null
                          ? DateTimeRange(start: startDate!, end: endDate!)
                          : DateTimeRange(
                              start: DateTime.now(),
                              end: DateTime.now().add(Duration(days: 1))),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2040),
                    );
                    if (pickedDateRange != null) {
                      setState(() {
                        startDate = pickedDateRange.start;
                        endDate = pickedDateRange.end;
                      });
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                      ),
                      const SizedBox(width: 10),
                      TextWidget(
                        text: startDate != null
                            ? "${startDate!.day}/${startDate!.month}/${startDate!.year}"
                            : "Start date",
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward),
                      const SizedBox(width: 10),
                      TextWidget(
                        text: endDate != null
                            ? "${endDate!.day}/${endDate!.month}/${endDate!.year}"
                            : "End date",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              lineWidget(),
              SizedBox(height: 20,),
              Column(
                children: [const
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Total Guest",
                      isBold: true,
                      fontSize: 20,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                    )
                  ],
                ),
                TextFieldWidget(controller: totalGuests,hintText: "How many guests?",leadingIcon: Icons.groups,)
                ],
              ),
              SizedBox(height: 20,),
              lineWidget(),
              SizedBox(height: 20,),

              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Guest Info",
                        fontSize: 20,
                        isBold: true,
                      ),
                      Icon(Icons.person_add_alt_1)
                    ],
                  ),
                  TextFieldWidget(
                    controller: nameController,
                    hintText: "Full name",
                  ),
                  SizedBox(height: 10,),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: "Email ",
                  ),
                  SizedBox(height: 10,),
                  PhoneTextField(
                    controller: phoneController,
                    onChanged: (string) {},
                    fillColor: MyAppColor.textFieldColor,
                  ),
                  SizedBox(height: 10,),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
              lineWidget(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Coupon Code",
                        isBold: true,
                        fontSize: 20,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                      )
                    ],
                  ),
                  TextFieldWidget(
                    controller: nameController,
                    hintText: "Apply coupon code",
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              lineWidget(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: "Price Detail",
                        isBold: true,
                        fontSize: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "\$225 x 2 nights",
                      ),
                      TextWidget(
                        text: "\$450",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "App service fee",
                      ),
                      TextWidget(
                        text: "\$85",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Taxes",
                      ),
                      TextWidget(
                        text: "\$120",
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              lineWidget(),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Total",
                    isBold: true,
                    fontSize: 20,
                  ),
                  TextWidget(
                    text: "\$655",
                    isBold: true,
                    fontSize: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Payment Method",
                    isBold: true,
                    fontSize: 20,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                onPress: () {
                  print("hello");
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          height: 400,
                          //width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // Ensure the column takes only as much space as needed
                            children: [
                              ImageContainer(
                                height: 200,
                                width: 100,
                                isRadius: false,
                                imageUrl: "assets/images/success.png",
                              ),
                              SizedBox(height: 10), // Add space between the image and text
                              TextWidget(
                                text: "Yeayy!!",
                                isBold: true,
                                fontSize: 20,
                              ),
                              SizedBox(height: 10), // Add space between the texts
                              TextWidget(
                                text: "Your reservation was completed, enjoy your vacation",
                                fontSize: 12,
                              ),
                              SizedBox(height: 20), // Add space before the button
                              ButtonWidget(
                                onPress: () {
                                  Navigator.pushAndRemoveUntil( context, MaterialPageRoute(builder: (context) => const HomeScreen()), (Route<dynamic> route) => false, );
                                },
                                title: 'Go to Home', // Add a title to the button
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                title: "Confirm and pay",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
