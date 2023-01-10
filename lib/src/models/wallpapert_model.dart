// ignore_for_file: public_member_api_docs, sort_constructors_first
class WallPaperModel {
  final String id;
  final String? createdAt;
  final String? thumbNail;
  final String? regularImage;
  final String? rawImage;
  final String? fullImage;
  WallPaperModel({
    required this.id,
    required this.createdAt,
    required this.thumbNail,
    required this.regularImage,
    required this.rawImage,
    required this.fullImage,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "createdAt": createdAt,
      "thumbNail": thumbNail,
      "regularImage": regularImage,
      "rawImage": rawImage,
      "fullImage": fullImage
    };
  }

  factory WallPaperModel.fromJson(Map<String, dynamic> json) {
    return WallPaperModel(
        id: json["id"],
        createdAt: json["created_at"],
        thumbNail: json["urls"]["thumb"],
        regularImage: json["urls"]["regular"],
        rawImage: json["urls"]["raw"],
        fullImage: json["urls"]["full"]);
  }
}
