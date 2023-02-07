class MusicModel {
  MusicModel? songModel;
  bool? isFav;

  MusicModel({this.songModel,this.isFav});

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      songModel: json['songModel'],
      isFav: json['isFav']);
  }
}