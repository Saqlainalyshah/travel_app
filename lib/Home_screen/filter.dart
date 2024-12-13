import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Home_screen/hotel_details.dart';
import 'package:travel_app/constant_widgets/app_color.dart';
import 'package:travel_app/constant_widgets/widget_ui_components.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> radioList=[
    "Price (low-high)",
    "Newest first","Top sellers","Price (high-low)","Customer top rated"
  ];

  int? clickedIndex;
  String? _selectedOption;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  List<bool> listOfBool=[false,false,false];
  void toggleSwitch(bool value,int index) {
    setState(() {
      listOfBool[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyAppColor.backgroundColor,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.close)),
        title: const TextWidget(text: "Filter",isBold: true,),
        ),
body: Padding(
  padding: const EdgeInsets.all(10.0),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        lineWidget(),
        const SizedBox(height: 20,),
        const TextWidget(text: "Category", isBold: true,fontSize: 20,),
        const SizedBox(height: 10,),
        const TextWidget(text: "Lorem ipsum dolor sit amet consectetur"),
        const SizedBox(height: 10,),
        SizedBox(
          height: 50,
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
              itemCount: itemList.length,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 5.0),
              child: OutLinedButton(
                index: index,
                pageIndex: clickedIndex,
                onPressed: (){
                  setState(() {
                    clickedIndex=index;
                  });
                },
                title: itemList[index].toString(),
              ),
            );
          }),
        ),
        const SizedBox(height: 20,),
        lineWidget(),
          const SizedBox(height: 20,),
        const TextWidget(text: "Sort By",isBold: true,fontSize: 20,),
        const TextWidget(text: "Lorem ipsum dolor sit amet consectetur"),
        SizedBox(
          height: 250,
          child: ListView.builder(
              itemCount: radioList.length,
              itemBuilder: (context,index){
            return Row(
              children: [
                Radio<String>(
                  activeColor: MyAppColor.buttonColor,
                  value: radioList[index],
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                const SizedBox(width: 10,),
                 Text(radioList[index])
              ],
            );
          }),
        ),
        lineWidget(),
        const SizedBox(height: 20,),
        const TextWidget(text: "Price range",isBold: true,fontSize: 20,),
        const TextWidget(text: "Lorem ipsum dolor sit amet consectetur"),
        const SizedBox(height: 20,),
       SizedBox(
         height: 70,
         child: ListView.builder(
             itemCount: PriceRange.priceRange.length,
             scrollDirection: Axis.horizontal,
             itemBuilder: (context,index){
               final value=PriceRange.priceRange[index];
           return  Row(
             children: [
               Container(
                 width: 150,
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.grey, // Border color
                     width: 1.5, // Border width
                   ),
                   borderRadius:
                   BorderRadius.circular(10), // Rounded corners
                 ),
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     Text(value.text),
                     TextWidget(text: value.price,isBold: true,)
                   ],
                 ),
               ),
               if(index==0)const Icon(Icons.arrow_forward,size: 50,color: Colors.grey,)
    
             ],
           );
         }),
       ),
        const SizedBox(height: 20,),
        lineWidget(),
        const SizedBox(height: 20,),
        const TextWidget(text: "Booking option",isBold: true,fontSize: 20,),
        const TextWidget(text: "Lorem ipsum dolor sit amet consectetur"),
        SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
                List<String> list=["Instan confirmation","Refundable","Allow pets"];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 TextWidget(text: list[index], isBold:true),
                Switch(
                  value: listOfBool[index],
                  onChanged: (val){
                    toggleSwitch(val,index);

                  },
                  activeColor: MyAppColor.buttonColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                ),
              ],
            );
          }),
        ),
        Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(text: "Clear all",isBold: true,fontSize: 20,),
            ButtonWidget(
              radius: 10.0,
              width: 150,
              onPress: (){

            }, title: "Show all places",)
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  ),
),
    );
  }
}

List<String> itemList=[
  "Hotel","Attraction","Restaurant"
];

class PriceRange{
  String price;
  String text;
  PriceRange({
    required this.price,
    required this.text
});

   static List<PriceRange> priceRange=[
    PriceRange(price: "\$50", text: "Minimum"),
    PriceRange(price: "\$245", text: "Maximum")
  ];
}
