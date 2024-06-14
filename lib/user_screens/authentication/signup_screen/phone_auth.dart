import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hangu_pesco_complaints_system/user_screens/authentication/signup_screen/signup_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:hangu_pesco_complaints_system/user_screens/user_home/user_home.dart';
import '../../../admin_screens/admin_home.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/color/color.dart';
import '../../../core/enums/view_state.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(create: (context) {
      return SignUpProvider();
    }, child: Consumer<SignUpProvider>(builder: (context, model, child) {
      return ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: PrimaryColor,
        ),
        inAsyncCall: model.state == ViewState.busy,
        child: Scaffold(
              backgroundColor: PrimaryColor,
              body: InkWell(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 70,
                        child: Image.asset(
                          "asset/logo.png",
                          height: 150,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: size.height / 1.5,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(55.0),
                              topRight: Radius.circular(55.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(4, 0),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          child: SingleChildScrollView(
                            child: Form(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15),
                                      const Center(
                                        child: Text(
                                          'Welcome Back',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(31, 79, 143, 1.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                      Text(
                                        "Signing your account",
                                        style: TextStyle(
                                          fontSize: size.width * 0.04,
                                          color: PrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                      if (!model.otpSent)
                                        Column(
                                          children: [
                                            SizedBox(height: 15),
                                            CustomTextField(
                                              hintText: 'Name',
                                              readOnly: false,
                                              controller: model.nameController,
                                              textAlign: TextAlign.start,
                                              textInputAction: TextInputAction.next,
                                              keyBoardType: TextInputType.name,
                                              preFixIcon: Icon(Icons.person_outline_rounded,color: Colors.grey,size: 20,),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return "Please enter your Name";
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(height: size.height * 0.02),
                                            CustomTextField(
                                              hintText: 'Phone no',
                                              readOnly: false,
                                              controller: model.phoneController,
                                              textAlign: TextAlign.start,
                                              textInputAction: TextInputAction.next,
                                              keyBoardType: TextInputType.text,
                                              autofillHints: [AutofillHints.name],
                                              preFixIcon: Icon(Icons.local_phone_outlined,color: Colors.grey,size: 20,),
                                              onChanged: (text) {
                                                if (text.length < 3) {
                                                  model.phoneController.text = '+92';
                                                  model.phoneController.selection =
                                                      TextSelection.fromPosition(
                                                        TextPosition(
                                                            offset:
                                                            model.phoneController.text.length),
                                                      );
                                                }
                                              },
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return "Please enter your Email";
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(height: size.height * 0.05),
                                          ],
                                        ),
                                      if (model.otpSent)
                                        TextField(
                                          controller: model.otpController,
                                          decoration: InputDecoration(
                                            hintText: "Enter OTP",
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 10,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffD4D9E4),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(7),
                                            ),
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: PrimaryColor,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(7),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffF7658B),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(7),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffF7658B),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(7),
                                            ),
                                            errorStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xffF7658B),
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
                                      const SizedBox(height: 30),
                                      Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: PrimaryColor,
                                          borderRadius: BorderRadius.circular(7),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            if (model.otpSent) {
                                              model.verifyOTP(context,model.phoneController.text,model.nameController.text);
                                            } else {
                                              model.sendOTP(context,model.phoneController.text,model.nameController.text);
                                            }
                                          },

                                          child: Text(
                                                  model.otpSent ? "Verify OTP" : "Send OTP",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: size.width * 0.035,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      SizedBox(height: 15),
                                      if (model.otpSent)
                                        Container(
                                          height: 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(7),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Enter the OTP sent to your phone",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
