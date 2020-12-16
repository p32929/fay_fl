import 'dart:convert';

class MeditationData {
  MeditationData({
    this.path,
    this.isPlaying,
  });

  String path;
  bool isPlaying;

  factory MeditationData.fromRawJson(String str) =>
      MeditationData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MeditationData.fromJson(Map<String, dynamic> json) => MeditationData(
        path: json["path"],
        isPlaying: json["isPlaying"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "isPlaying": isPlaying,
      };
}

class JournalData {
  JournalData({
    this.name,
    this.today,
  });

  String name;
  String today;

  factory JournalData.fromRawJson(String str) =>
      JournalData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JournalData.fromJson(Map<String, dynamic> json) => JournalData(
        name: json["name"],
        today: json["today"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "today": today,
      };
}
