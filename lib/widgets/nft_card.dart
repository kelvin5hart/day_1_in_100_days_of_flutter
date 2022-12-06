import 'package:flutter/material.dart';

class NFTCard extends StatelessWidget {
   const NFTCard({
    Key? key, required this.nftPrice, required this.nftName, required this.nftImage
  }) : super(key: key);

  final String nftImage;
  final String nftName;
  final String nftPrice;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(20),
                  child: Image.asset(
                    nftImage,
                    fit: BoxFit.cover,
                  ))),
          const SizedBox(
            height: 10,
          ),
           Text(
            nftName,
            style: const TextStyle(
                color: Colors.white60, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
           Text(
            nftPrice,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}