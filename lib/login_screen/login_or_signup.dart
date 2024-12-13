import 'package:flutter/material.dart';
import 'package:travel_app/constant_widgets/app_color.dart';
import 'package:travel_app/constant_widgets/widget_ui_components.dart';

class LoginOrSignupScreen extends StatefulWidget {
   const LoginOrSignupScreen({super.key});

  @override
  State<LoginOrSignupScreen> createState() => _LoginOrSignupScreenState();
}

class _LoginOrSignupScreenState extends State<LoginOrSignupScreen> {
  final TextEditingController _phoneNumberController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double mediaHeight=MediaQuery.sizeOf(context).height;
    double mediaWidth=MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyAppColor.backgroundColor,
        actions: [
          ButtonWidget(onPress: (){},
            title: "X",color: Colors.white,
            titleColor:Colors.black,
            width: mediaWidth*0.03,
            fontSize: 18.0,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10,5,10,mediaHeight*0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TextWidget(text: "Login or Sign up",isBold: true,fontSize: 30.0,),
            const TextWidget(text: "Lorem ipsum dolor sit amet consectetur. Eu interdum sed pretium nulla neque purus velit quis massa.",),
            const TextWidget(text: "Phone Number",fontSize: 20.0,),
            PhoneTextField(controller: _phoneNumberController, onChanged: (value){}),
            ButtonWidget(onPress: (){},title: "Continue",),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 2.0,
                  width: MediaQuery.sizeOf(context).width*0.4,
                  color: Colors.grey,
                ),
                const TextWidget(text: "or"),
                Container(
                  height: 2.0,
                  width: MediaQuery.sizeOf(context).width*0.4,
                  color: Colors.grey,
                ),
              ],
            ),
            ButtonWidget(
              widget: SizedBox(height: 25,width: 25,
                child: Image.asset("assets/images/google.png"),
              ),
              onPress: (){},
              title: "Continue with Google",
              titleColor: Colors.black,
              color: MyAppColor.textFieldColor,
            ),
            ButtonWidget(
              icon: const Icon(Icons.apple,color: Colors.black,size: 35,),
              onPress: (){},
              title: "Continue with Apple",
              titleColor: Colors.black,
              color: MyAppColor.textFieldColor,
            ),
            ButtonWidget(
              icon: const Icon(Icons.facebook,color: Colors.blue,size: 30,),
              onPress: (){},
              title: "Continue with Facebook",
              titleColor: Colors.black,
              color: MyAppColor.textFieldColor,
            ),
            ButtonWidget(
              widget: SizedBox(height: 35,width: 35,
              child: Image.asset("assets/images/x.jpg"),
              ),
              onPress: (){},
              title: "Continue with Twitter",
              titleColor: Colors.black,
              color: MyAppColor.textFieldColor,
            )
          ],
        ),
      ),
    );
  }
}




///OTP Screen of Login Screen
class OtpScreen extends StatefulWidget {
   OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
  final TextEditingController _con1=TextEditingController();
  final TextEditingController _con2=TextEditingController();
  final TextEditingController _con3=TextEditingController();
  final TextEditingController _con4=TextEditingController();
  final TextEditingController _con5=TextEditingController();
  final TextEditingController _con6=TextEditingController();

}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {


    double mediaHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: MyAppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyAppColor.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10,5,10,mediaHeight*0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TextWidget(text: "Login or Sign up",isBold: true,fontSize: 30.0,),
            const TextWidget(text: "Lorem ipsum dolor sit amet consectetur. Eu interdum sed pretium nulla neque purus velit quis massa.",),
            const TextWidget(text: "A verification code has been sent to +6299876451",isBold: true,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpBoxFieldWidget(controller: widget._con1),
                OtpBoxFieldWidget(controller: widget._con2,),
                OtpBoxFieldWidget(controller: widget._con3),
                OtpBoxFieldWidget(controller: widget._con4),
                OtpBoxFieldWidget(controller: widget._con5),
                OtpBoxFieldWidget(controller: widget._con6),
              ],
            ),
            const TextWidget(text: "Resend in: 35",color: Colors.grey,),
            ButtonWidget(onPress: (){},title: "Continue",),
          ],
        ),
      ),
    );
  }
}


///
class OtpBoxFieldWidget extends StatefulWidget {
  const OtpBoxFieldWidget({super.key,
  required this.controller
  });

  @override
  State<OtpBoxFieldWidget> createState() => _OtpBoxFieldWidgetState();

  final TextEditingController controller;
}

class _OtpBoxFieldWidgetState extends State<OtpBoxFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 42.8,
      decoration: BoxDecoration(
        color: MyAppColor.textFieldColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintText: "*",
          hintStyle: TextStyle(fontSize: 20.0),
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
