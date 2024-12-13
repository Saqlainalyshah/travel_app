import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home_screen/hotel_details.dart';
import 'app_color.dart';

///Button widget
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
        this.isLoading = false,
        this.title = '',
        this.icon,
        this.widget,
        this.fontSize = 14.0,
        this.radius=30.0,
        this.width = double.infinity,
        this.height = 60.0,
        this.color = MyAppColor.buttonColor,
        this.titleColor = Colors.white,
        required this.onPress});

  final bool isLoading;
  final String title;
  final Icon? icon;
  final Widget? widget;
  final double fontSize;
  final double height;
  final double width;
  final Color titleColor;
  final double radius;
  final Color color;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        onPress();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: color),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
              color: Colors.white,
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8), // Add space between icon and text
                ],
                if (widget!= null) ...[
                  widget!,
                  const SizedBox(width: 8), // Add space between icon and text
                ],
                TextWidget(
                  text: title,
                  color: titleColor,
                  fontSize: fontSize,
                  isBold: true,
                ),
              ],
            )),
      ),
    );
  }
}



///Text Widget

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color color;
 final bool isBold;

  const TextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.color = Colors.black,
    this.isBold=false,
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 5,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight:isBold? FontWeight.bold:FontWeight.normal,
      ),
    );
  }
}

///ListTile Widget

class ListTileWidget extends StatelessWidget {
 final Widget? leadingWidget;
  final double leadingIconSize;
  final IconData? leadingIcon;
  final Color leadingIconColor;
  final double trailingIconSize;
  final IconData? trailingIcon;
  final Color trailingIconColor;
  final Color subTitleColor;
  final Color titleColor;
  final String title;
  final String? subtitle;

   const ListTileWidget({
     this.leadingWidget,
     this.leadingIconSize=24.0,
     this.leadingIcon,
     this.leadingIconColor=Colors.black,
     this.trailingIconSize=24.0,
     this.trailingIcon,
     this.trailingIconColor=Colors.black,
     required this.title,
     this.titleColor=Colors.black,
     this.subtitle,
     this.subTitleColor=Colors.black,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 10.0,
      minVerticalPadding: 8.0,
      leading:leadingIcon != null? Icon(
        leadingIcon,
        size: leadingIconSize,
        color: leadingIconColor,
      ):leadingWidget,
      title: Text(title,style: TextStyle(color: titleColor,),),
     subtitle: Text(subtitle.toString(),style: TextStyle(color: subTitleColor),),
      trailing:  Icon(
      trailingIcon,
      size: trailingIconSize,
      color: trailingIconColor,
    ),
    );
  }
}

/// 5) Phone Number Text Field
class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.isBorder=false,
    this.radius=10.0,
    this.fillColor=Colors.white
  });
  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool isBorder;
  final double radius;
 final Color fillColor;
}
class _PhoneTextFieldState extends State<PhoneTextField> {
  Country selectedCountry = Country(
    phoneCode: "92",
    countryCode: "PK",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Pakistan",
    example: "Pakistan",
    displayName: "Pakistan",
    displayNameNoCountryCode: "PK",
    e164Key: " ",
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: widget.isBorder? const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          ):BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  widget.isBorder? const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          ):BorderSide.none,// Remove the underline when the field is enabled
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  widget.isBorder?  const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          ):BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        hintText: "Enter phone number",
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: widget.fillColor,
        prefixIcon: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2, // Adjusted width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max, // Ensures Row takes only the necessary space
            children: [
              TextWidget(
                text: "+${selectedCountry.phoneCode}",
                isBold: true, // Optionally bold for better readability
              ),
              InkWell(
                onTap: (){
                  showCountryPicker(
                      context: context,
                      onSelect: (value) {
                        setState(() {
                          selectedCountry = value;
                          //debugPrint("${selectedCountry.phoneCode} is code of country");
                        });
                      },
                      countryListTheme: const CountryListThemeData(
                          margin: EdgeInsets.all(10.0),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          bottomSheetHeight: 400));
                },
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        suffixIcon: widget.controller.text.length == 10
            ? const Icon(
          Icons.check_circle,
          color: Colors.green,
        )
            : null,
      ),
    );
  }
}


///Text Field Widget
class TextFieldWidget extends StatefulWidget {
  // Constructor
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.leadingIcon,
    this.trailingIcon,
    this.fillColor = MyAppColor.textFieldColor,
    this.textInputType = TextInputType.text,
    this.secure = false,
    this.readOnly = false,
    this.radius = 10,
    this.hintText = " ",
    this.isBorder = false,
    this.labelText,
    //this.onChanged,
    //this.trailingFn,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();

  final bool secure, readOnly;
  final String? labelText;
  final bool isBorder;
  final String hintText;
  final double radius;
  final TextInputType textInputType;
  final Color fillColor;
  final TextEditingController controller;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
 // final void Function(String)? onChanged;
  //final VoidCallback? trailingFn;
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      obscureText: widget.secure,
      controller: widget.controller,
     // onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        labelText: widget.labelText,
       // contentPadding: const EdgeInsets.only(left: 5.0, right: 10),
        border: OutlineInputBorder(
          borderSide: widget.isBorder? const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          ):BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  widget.isBorder? const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          ):BorderSide.none,// Remove the underline when the field is enabled
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  widget.isBorder?  const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
          ):BorderSide.none,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        filled: true,
        fillColor: widget.fillColor,
        prefixIcon: widget.leadingIcon == null
            ? null
            : Icon(widget.leadingIcon, color: Colors.black54, size: 25.0),
        suffixIcon: widget.trailingIcon == null
            ? null
            : InkWell(
         // onTap: widget.trailingFn,
          child: Icon(widget.trailingIcon, color: Colors.black38, size: 25.0),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}


///image container

/// Slider Card
class ImageContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final Widget? child;
  final bool isRadius;

  const ImageContainer({super.key,
    this.height,
    required this.isRadius,
    this.child,
    this.width,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: isRadius?BorderRadius.circular(15):null,
          image:  DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl)
          )
      ),
      child: child,
    );
  }
}

/// Slider Card Widget for Home Screen
class SliderCardWidget extends StatelessWidget {
  const  SliderCardWidget({super.key,
    required this.imageUrl,
    required this.text,
    required this.price,

  });
  final String imageUrl;
  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const HotelDetails(imageUrl: "assets/images/Rectangle30.png")));
            },
            child: ImageContainer(
              isRadius: true,
              imageUrl: "assets/images/Rectangle30.png",
              height: 250,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: MyAppColor.textFieldColor.withOpacity(0.5)
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.star,color: Colors.yellow,),
                          TextWidget(text: "4.9" ,isBold: true,color: Colors.white,)
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: MyAppColor.textFieldColor.withOpacity(0.5)
                      ),
                      child: const Icon(Icons.favorite_border,color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          TextWidget(text: text,isBold: true,fontSize: 16,),
          TextWidget(text: price,isBold: true,fontSize: 12,)

        ],
      ),
    );
  }
}


class OutLinedButton extends StatelessWidget {
   const OutLinedButton({super.key,
   this.leadingIcon,
    required this.title,
      this.index,
      this.pageIndex,
    required this.onPressed
  });

final IconData? leadingIcon;
final String title;
final int? index;
final int? pageIndex;
final Function onPressed;

  @override
  Widget build(BuildContext context) {
   return OutlinedButton.icon(
      onPressed: () {
        onPressed();
      },
      icon: leadingIcon!=null? Icon(leadingIcon,  color:index==pageIndex?Colors.blue:Colors.black):null, // Leading icon
      label: Text(
        title,
        style: TextStyle(color:index==pageIndex? Colors.blue:Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color:index==pageIndex? Colors.blue:Colors.black), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45), // Rounded corners
        ),
      ),
    );
  }
}
