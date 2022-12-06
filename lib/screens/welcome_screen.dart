import 'dart:math';

import 'package:day_1_in_100_days_of_flutter/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_action/slide_action.dart';

import '../widgets/rotating_box.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double rotate = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F2D3A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Container(),
                Positioned(
                  right: -50,
                  top: MediaQuery.of(context).size.height / 5,
                  child: Transform.rotate(
                      angle: rotate,
                      child: RotatingBox(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color:const Color(0x50686799), width: 3)),
                        ),
                      )),
                ),
                Positioned(
                  right: -40,
                  top: MediaQuery.of(context).size.height / 5,
                  child: Transform.rotate(
                      angle: rotate,
                      child: RotatingBox(
                        durationInSeconds: 30,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: const Color(0x80686799), width: 2)),
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 220),
                      child: Text(
                        "Enjoy the most beautiful NFT's ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: -100,
                  left: -50,
                  child: Transform.rotate(
                      angle: rotate,
                      child: RotatingBox(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color:const Color(0x50686799), width: 3)),
                        ),
                      )),
                ),
                Positioned(
                  left: -30,
                  top: -80,
                  child: Transform.rotate(
                      angle: rotate,
                      child: RotatingBox(
                        durationInSeconds: 30,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: const Color(0x80686799), width: 2)),
                        ),
                      )),
                ),
              ],
            )),
            LottieBuilder.asset("assets/89868-enjoy-beach-vacation.json"),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SlideAction(
                  trackBuilder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0x80686799),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Opacity(
                          opacity: 1 - 1 * state.thumbFractionalPosition,
                          child: Text(
                            "Swipe to get started",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryIconTheme.color,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  thumbBuilder: (context, state) {
                    return Transform.rotate(
                      angle: 1 * pi * state.thumbFractionalPosition,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          // Show loading indicator if async operation is being performed
                          child: state.isPerformingAction
                              ? const CupertinoActivityIndicator(
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    );
                  },
                  action: () async {
                    // Async operation
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () => Get.to(() => const HomeScreen()),
                    );
                  },
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
