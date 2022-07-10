class Update {
  final String name;
  final String type;
  final String image;
  final String shelf;

   Update({required this.name, required this.type,required this.image,required this.shelf});

  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      name: json['name'],
      type: json['type'],
      image: json['image'],
      shelf: json['shelf'],
    );
  }
}