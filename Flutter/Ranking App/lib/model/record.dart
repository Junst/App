class Record {
  final String id;
  final String name;
  final String describe;
  final int challenger;
  final int popular;
  final String img;

  const Record({
    required this.id,
    required this.name,
    required this.describe,
    required this.challenger,
    required this.popular,
    required this.img
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json['id'],
        name: json['name'],
        describe: json['describe'],
    challenger: json['challenger'],
    popular: json['popular'],
    img : json['img']
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'describe': describe,
        'challenger': challenger,
    'popular': popular,
    'img':img
      };
}
