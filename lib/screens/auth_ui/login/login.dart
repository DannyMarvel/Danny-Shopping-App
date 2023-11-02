import 'package:danny_esl/constants/routes.dart';
import 'package:danny_esl/firebase_helper/firebase_auth_helper.dart';
import 'package:danny_esl/screens/auth_ui/sign_up/sign_up.dart';
import 'package:danny_esl/screens/home/home.dart';
import 'package:danny_esl/widgets/primary_button/primary_button.dart';
import 'package:danny_esl/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(
                title: 'Login', subtitle: 'Welcome Back to Dynamic Ecommerce'),
            SizedBox(
              height: 46,
            ),
            TextFormField(
               controller: email,
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
              title: 'Login',
              onPressed: () async {
                bool isValidated = loginValidation(email.text, password.text);
                if (isValidated) {
                  bool isLogined = await FirebaseAuthHelper.instance
                      .login(email.text, password.text, context);

                  if (isLogined) {
                    Routes.instance
                        .pushAndRemoveUntil(widget: Home(), context: context);
                  }
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            Text('Don\'t have an account?'),
            SizedBox(
              height: 12,
            ),
            CupertinoButton(
              onPressed: () {
                Routes.instance.push(widget: SignUp(), context: context);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
