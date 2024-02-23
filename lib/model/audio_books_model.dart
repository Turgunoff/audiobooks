//
// @Author: "Eldor Turgunov"
// @Date: 23.02.2024
//

class AudioBooks {
  String? title;
  String? text;
  String? img;
  String? audio;

  AudioBooks({this.title, this.text, this.img, this.audio});

  AudioBooks.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    img = json['img'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['text'] = this.text;
    data['img'] = this.img;
    data['audio'] = this.audio;
    return data;
  }
}
