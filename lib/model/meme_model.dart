

class Memes {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;
  int? captions;

  Memes(
      {this.id,
        this.name,
        this.url,
        this.width,
        this.height,
        this.boxCount,
        this.captions});

  Memes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    boxCount = json['box_count'];
    captions = json['captions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    data['box_count'] = boxCount;
    data['captions'] = captions;
    return data;
  }
}
