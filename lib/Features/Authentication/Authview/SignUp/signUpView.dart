import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';
import 'package:spareproject/Features/Authentication/Authview/SignIn/Login.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool obscureText = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authViewmodel = Provider.of<Authviewmodel>(context);
    return Scaffold(
      backgroundColor: authColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Helo\nWelcome !',
                          style: authText(40, whiteColor, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          'Sign-Up',
                          style: authText(24, whiteColor, FontWeight.w600),
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: authText(
                          size.width * 0.04, whiteColor, FontWeight.w700),
                    ),
                    SizedBox(height: 2),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Plaese  Enter Your Name';
                        }
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        label: Text(
                          'Enter Your Name',
                          style: authText(
                              size.width * 0.035, whiteColor, FontWeight.w300),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Text(
                      'E-Mail',
                      style: authText(
                          size.width * 0.04, whiteColor, FontWeight.w700),
                    ),
                    SizedBox(height: 2),
                    TextFormField(
                      controller: authViewmodel.emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Plaese enter your E-Mail';
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          'Enter Your E-Mail',
                          style: authText(
                              size.width * 0.035, whiteColor, FontWeight.w300),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Text(
                      'Password',
                      style: authText(
                          size.width * 0.04, whiteColor, FontWeight.w700),
                    ),
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                        return 'Please enter Your Password';
                        }
                      },
                      obscureText: obscureText,
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(obscureText
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        label: Text(
                          'Enter Your Password',
                          style: authText(
                              size.width * 0.035, whiteColor, FontWeight.w300),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Text(
                      'Confirm Password',
                      style: authText(
                          size.width * 0.04, whiteColor, FontWeight.w700),
                    ),
                    SizedBox(height: 2),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Confirm Your Pasword';
                        }else if(value != passwordController.text){
                          return "Password Must be Same";
                        }
                      },
                      controller: confirmController,
                      decoration: InputDecoration(
                        label: Text(
                          'Confirm Your Password',
                          style: authText(
                              size.width * 0.035, whiteColor, FontWeight.w300),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            authViewmodel.signUp(
                              context: context,
                              name: nameController.text,
                              email: authViewmodel.emailcontroller.text,
                              password: passwordController.text,
                              confirmpassword: confirmController.text);
                          }
                        },
                        child: Container(
                          height: size.height * 0.056,
                          width: size.width * 0.67,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03),
                          ),
                          child: Center(
                            child: Text(
                              'Send OTP',
                              style: authText(size.width * 0.035, whiteColor,
                                  FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: authText(
                              size.width * 0.035, whiteColor, FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ));
                          },
                          child: Text(
                            ' LogIn?',
                            style: authText(size.width * 0.035, whiteColor,
                                FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
