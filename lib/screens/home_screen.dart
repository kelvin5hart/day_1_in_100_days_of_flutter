import 'package:day_1_in_100_days_of_flutter/screens/selected_nft_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/nft_list.dart';
import '../widgets/nft_card.dart';
import '../widgets/rotating_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F2D3A),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0x80686799),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "13,100",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Hot Bid",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
              Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(),
                      Center(
                        child: Transform.rotate(
                            angle: 0,
                            child: RotatingBox(
                              child: Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color:const Color(0x50686799), width: 4)),
                              ),
                            )),
                      ),
                      Center(
                        child: RotatingBox(
                          durationInSeconds: 30,
                          child: Container(
                            height: 350,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0x80686799), width: 4)),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(nft[1].nftImage),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0x80686799),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nft[1].nftName,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Highest Bid: ${nft[1].nftPrice}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD0D5F1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                      child: Text(
                                    "Place a Bid",
                                    style: TextStyle(color: Colors.black),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Popular Bids",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "View all",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: nft.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Get.to(() =>  SelectedNFTScreen(),
                                        arguments: [
                                          nft[index].id,
                                          nft[index].nftImage,
                                          nft[index].nftName,
                                          nft[index].nftPrice,
                                          nft[index].ownerName,
                                          nft[index].ownerHandle
                                        ]);
                                  },
                                  child: NFTCard(
                                    nftPrice: nft[index].nftPrice,
                                    nftName: nft[index].nftName,
                                    nftImage: nft[index].nftImage,
                                  ));
                            }),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
