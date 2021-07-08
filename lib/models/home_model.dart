import 'dart:convert';

import 'player_model.dart';

enum Album { album1, album2, album3, album4, album5, album6 }

extension AlbumStringExt on String {
  Album get parse => {
        "album1": Album.album1,
        "album2": Album.album2,
        "album3": Album.album3,
        "album4": Album.album4,
        "album5": Album.album5,
        "album6": Album.album6,
      }[this]!;
}

extension AlbumExt on Album {
  String get parse => {
        Album.album1: "album1",
        Album.album2: "album2",
        Album.album3: "album3",
        Album.album4: "album4",
        Album.album5: "album5",
        Album.album6: "album6",
      }[this]!;
}

class HomeModel {
  final String title;
  final List<PlayerModel> info;
  final String image;
  final Album album;
  final String band;

  HomeModel({
    required this.title,
    required this.info,
    required this.image,
    required this.album,
    required this.band,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'info': info.map((x) => x.toMap()).toList(),
      'image': image,
      'album': album.parse,
      'band': band
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
        title: map['title'],
        info: List<PlayerModel>.from(
            map['info']?.map((x) => PlayerModel.fromMap(x))),
        image: map['image'],
        album: map['album'].toString().parse,
        band: map['band']);
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));
}
