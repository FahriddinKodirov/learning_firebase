import 'package:flutter/material.dart';
import 'package:learning_firebase/data/auth/auth_number_repo.dart';
import 'package:learning_firebase/utils/my_utils.dart';
import 'package:provider/provider.dart';

class NumberLoginPage extends StatefulWidget {
  const NumberLoginPage({super.key});

  @override
  State<NumberLoginPage> createState() => _NumberLoginPageState();
}

class _NumberLoginPageState extends State<NumberLoginPage> {
  final otpController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String num = '';



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Provider.of<AuthNumberViewModel>(context).spinnerLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : 
               Provider.of<AuthNumberViewModel>(context, listen: false).currentState == PhoneVerificationState.SHOW_PHONE_FORM_STATE
                      ? getPhoneFormWidget(context)
                      : getOTPFormWidget(context),
            ],
          ),
        ),
      ),
    ));
  }

  getPhoneFormWidget(context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(height(context)*0.03),
            child: TextField(
              controller: controller,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
              hintText: "Number",
              prefixIcon: Icon(Icons.confirmation_number_rounded)),
        ),
          ),
          ElevatedButton(
              onPressed: () {
              formKey.currentState?.save();
              Provider.of<AuthNumberViewModel>(context, listen: false).signUpWithNumber(number: controller.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade900, // background
                onPrimary: Colors.white, // foreground
              ),
              child: const Text("Verify Phone Number")),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getOTPFormWidget(context) {
    return Column(
      children: [
        const Text(
          "Enter OTP Number",
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(
          height: 40.0,
        ),
        TextField(
          controller: otpController,
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
              hintText: "OTP Number",
              prefixIcon: Icon(Icons.confirmation_number_rounded)),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          onPressed: () => Provider.of<AuthNumberViewModel>(context, listen: false).verifyOTPButton(opt: otpController.text,context: context),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade900, // background
            onPrimary: Colors.white, // foreground
          ),
          child: const Text("Verify OTP Number"),
        ),
      ],
    );
  }
}