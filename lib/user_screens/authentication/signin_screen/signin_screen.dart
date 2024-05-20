import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangu_pesco_complaints_system/user_screens/authentication/signin_screen/signin_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_textfield.dart';
import '../../../components/save_button.dart';
import '../../../core/color/color.dart';
import '../../../core/enums/view_state.dart';
import '../signup_screen/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(create: (context) {
      return SignInProvider();
    }, child: Consumer<SignInProvider>(builder: (context, model, child) {
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
                      )),
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
                          key: model.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                  height: 15,
                                ),

                                  Center(child: const Text('Welcome Back',style: TextStyle(fontSize:25 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(31, 79, 143, 1.0)),)),

                                  SizedBox(height: size.height * 0.03),
                                  Text(
                                    "Signing your account",
                                    style: TextStyle(
                                        fontSize: size.width * 0.04,
                                        color: PrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15),
                                  CustomTextField(
                                    hintText: 'Email',
                                    readOnly: false,
                                    controller: _emailController,
                                    textAlign: TextAlign.start,
                                    keyBoardType: TextInputType.emailAddress,
                                    preFixIcon: Icon(Icons.email_outlined,color: Colors.grey,size: 20,),
                                    textInputAction: TextInputAction.next,
                                    autofillHints: [AutofillHints.email],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your Email";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  CustomTextField(
                                    hintText: 'Password',
                                    readOnly: false,
                                    controller: _passwordController,
                                    textAlign: TextAlign.start,
                                    obscureText: model.isVisiblePassword,
                                     keyBoardType:
                                    TextInputType.visiblePassword,
                                    autofillHints: [AutofillHints.password],
                                    textInputAction: TextInputAction.done,
                                    preFixIcon: Icon(Icons.password_outlined,color: Colors.grey,size: 18,),
                                    suffixIcon: IconButton(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onPressed: () {
                                        model.visiblePassword();
                                      },
                                      icon: model.isVisiblePassword
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your Password";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: size.height * 0.05),
                                ],
                              ),

                              /// Signin Button >>>
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: size.height * 0.03),
                                    InkWell(
                                      onTap: () {
                                        TextInput.finishAutofillContext();
                                        if (model.formKey.currentState!
                                            .validate()) {
                                          model.loginUser(_emailController.text,
                                              _passwordController.text, context);
                                        };
                                      },
                                      child: SaveButton(
                                        txt: "Login"
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                  ],
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Join us before?",
                                    style: TextStyle(
                                        fontSize: 14,

                                        color: Color.fromRGBO(31, 79, 143, 1.0)),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>  SignUpScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Sign up ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: size.height * 0.03),

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
    }));
  }
}