import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';
import 'package:spareproject/Features/Authentication/Authview/SignUp/signUpView.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: authColor,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Welcome Back!',
                  style:
                      authText(size.width * 0.1, whiteColor, FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: Image.asset(
                    'Group 23.png'.ImagePath,
                    height: size.height * 0.275,
                    width: size.width * 0.55,
                  ),
                ),
                Text(
                  'Log-In',
                  style: authText(25, whiteColor, FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'E-Mail',
                  style:
                      authText(size.width * 0.04, whiteColor, FontWeight.w700),
                ),
                SizedBox(height: size.height * 0.0125),
                TextFormField(
                  controller: loginController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your E-mail';
                    }
                  },
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Your E-mail',
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
                  style:
                      authText(size.width * 0.04, whiteColor, FontWeight.w700),
                ),
                SizedBox(height: size.height * 0.0125),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                  },
                  obscureText: obscureText,
                  controller: passController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: whiteColor,
                    ),
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
                SizedBox(height: size.height * 0.0125),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: authText(
                          size.width * 0.035, whiteColor, FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.0125),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authViewModel.logIn(
                          context: context,
                          email: loginController.text,
                          password: passController.text);
                      }
                    },
                    child: Container(
                      height: size.height * 0.056,
                      width: size.width * 0.67,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(size.width * 0.03),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: authText(
                              size.width * 0.035, whiteColor, FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.0125),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: authText(
                          size.width * 0.035, whiteColor, FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ));
                      },
                      child: Text(
                        'Sign-up',
                        style: authText(
                            size.width * 0.035, whiteColor, FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
