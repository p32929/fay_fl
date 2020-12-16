class MeditationData {
  String path;
  bool isPlaying;

  MeditationData(this.path, this.isPlaying);
}

class JournalData {
  String name;
  String today;

  JournalData(this.name, {this.today});
}
