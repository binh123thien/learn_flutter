import 'package:flutter/material.dart';
import 'package:screen/src/constants/color.dart';
import 'package:screen/src/constants/image_strings.dart';
import 'package:screen/src/constants/sizes.dart';
import 'package:screen/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: const AssetImage(tWelcomeScreenImage),
                height: height * 0.6,
              ),
              Column(
                children: [
                  Text(
                    tWelcomeTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    tWelcomeSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            tLogin.toUpperCase(),
                            style: const TextStyle(fontSize: 22),
                          ))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(tSignup.toUpperCase(),
                              style: const TextStyle(fontSize: 22)))),
                ],
              )
            ],
          )),
    );
  }
}
