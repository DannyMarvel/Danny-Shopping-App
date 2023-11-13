import 'package:danny_esl/constants/routes.dart';
import 'package:danny_esl/screens/auth_ui/login/login.dart';
import 'package:danny_esl/screens/home/home.dart';
import 'package:danny_esl/widgets/primary_button/primary_button.dart';
import 'package:danny_esl/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../firebase_helper/firebase_auth_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //This controls the overflow error
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(
                  title: 'Create an Account',
                  subtitle: 'Welcome Back to Dynamic Ecommerce'),
              SizedBox(
                height: 46,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(
                    Icons.person_outline,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  prefixIcon: Icon(
                    Icons.password_sharp,
                  ),
                  suffixIcon: CupertinoButton(
                    onPressed: () {
                      //we assigned it to true, so we can link it with ObsecureText
                      isShowPassword = !isShowPassword;
                    },
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36),
              PrimaryButton(
                title: 'Create an account',
                onPressed: () async {
                  bool isValidated = signUpValidation(
                      email.text, password.text, name.text, phone.text);
                  if (isValidated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .signUp(name.text, email.text, password.text, context);
        
                    if (isLogined) {
                      Routes.instance
                          .pushAndRemoveUntil(widget: Home(), context: context);
                    }
                  }
        
                  Routes.instance
                      .pushAndRemoveUntil(widget: Login(), context: context);
                },
              ),
              SizedBox(
                height: 24,
              ),
              Text('I already have an account?'),
              SizedBox(
                height: 12,
              ),
              CupertinoButton(
                onPressed: () {
                  Routes.instance
                      .pushAndRemoveUntil(widget: Login(), context: context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
