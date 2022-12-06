import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedNFTScreen extends StatelessWidget {
  SelectedNFTScreen({Key? key}) : super(key: key);

  final nft = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(nft[2]),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              nft[1],
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(nft[1])),
                  )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 40, bottom: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white70,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 35,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nft[4],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        nft[5],
                                        style: const TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF686799),
                                    borderRadius: BorderRadius.circular(10)),
                                child:  Center(
                                    child: Text(
                                      nft[3],
                                  style: const TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Popular Bids",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              "It looks simple: just create a Container with decoration from an image resource (from assets or network), then add a BackdropFilter as its However BackdropFilter must come with a ImageFilter.blur. In case you want to add an overlay above the blur effect, let add an extra layer is Black color with opacity as child of BackdropFilter."),
                          Expanded(child: Container()),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2F2D3A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: const SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child:
                                      Center(child: Text("Place a Bid"))))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
