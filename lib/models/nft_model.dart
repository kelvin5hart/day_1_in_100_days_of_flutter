
class NFTModel {
  NFTModel(
      {required this.id,
        required this.nftImage,
      required this.nftName,
      required this.nftPrice,
      this.ownerHandle,
      this.ownerName,
      this.ownerPic});

  String id;
  String nftImage;
  String nftName;
  String nftPrice;
  String? ownerPic;
  String? ownerName;
  String? ownerHandle;
}
