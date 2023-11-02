import 'package:danny_esl/constants/asset_images.dart';
import 'package:danny_esl/constants/routes.dart';
import 'package:danny_esl/screens/auth_ui/login/login.dart';
import 'package:danny_esl/screens/auth_ui/sign_up/sign_up.dart';
import 'package:danny_esl/widgets/primary_button/primary_button.dart';
import 'package:danny_esl/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(
                title: 'Shop from home using this App', subtitle: 'welcome'),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
                scale: 5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.facebook,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Image.asset(
                    AssetsImages.instance.googleLogo,
                    scale: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            PrimaryButton(
              onPressed: () {
                Routes.instance.push(
                  widget: Login(),
                  context: context,
                );
              },
              title: 'Login',
            ),
            SizedBox(
              height: 18,
            ),
            PrimaryButton(
              onPressed: () {
                Routes.instance.push(widget: SignUp(), context: context);
              },
              title: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
