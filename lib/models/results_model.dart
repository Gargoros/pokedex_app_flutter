class Results {
  String? name;
  String? url;
  int? id;

  Results({this.name, this.url, this.id});

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    id = int.parse(url!.split('/')[6]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}
