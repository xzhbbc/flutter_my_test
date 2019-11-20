class MovieData {
  int _code;
  String _title;
  List<Data> _data;

  MovieData({int code, String title, List data}) {
    this._code = code;
    this._title = title;
    this._data = data;
  }

  String get title => _title;
  set title(String title) => _title = title;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  int get code => _code;
  set code(int code) => _code = code;

  MovieData.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    if (json['subjects'] != null) {
      _data = new List<Data>();
      json['subjects'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  List _genres;
  String _id;
  String _alt;
  Map _images;
  String _type;
  String _img;
  String _title;

  Data({
    List genres,
    String id,
    String alt,
    Map images,
    String type,
    String img,
    String title,
  }) {
    this._genres = genres;
    this._id = id;
    this._alt = alt;
    this._images = images;
    this._type = type;
    this._img = img;
    this._title = title;
  }

  List get genres => _genres;
  set genres(List genres) => _genres = genres;
  String get id => _id;
  set id(String id) => _id = id;
  String get alt => _alt;
  set alt(String alt) => _alt = alt;
  Map get images => _images;
  set images(Map images) => _images = images;
  String get type => _type;
  set type(String type) => _type = type;
  String get img => _img;
  set img(String img) => _img = img;
  String get title => _title;
  set title(String title) => _title = title;

  Data.fromJson(Map json) {
    _alt = json['alt'];
    _id = json['id'];
    _images = json['images'];
    _genres = json['genres'];
    _title = json['title'];
    json['genres'].forEach((v) {
      if (_type == '' || _type == null) {
        _type = v;
      } else {
        _type += ' ' + v;
      }
    });
    if (json['images'] != null) {
      var smImg = json['images']['small'];
      if (smImg != null && smImg != '') {
        _img = smImg;
      }
    }
  }
}
