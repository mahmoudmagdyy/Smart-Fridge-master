class Content {
  Content({
  this.name,
  this.usingTime,
  this.quantity,
  this.type,
  this.image,
  this.shelf

  });

  String? name;
  String? usingTime;
  int? quantity;
  String? type;
  String? image;
  String? shelf;


  factory Content.fromMap(Map<String, dynamic> json) => Content(
    name: json["name"],
    usingTime: json["usingTime"],
    quantity: json["quantity"],
    type: json["type"],
    image: json["image"],
    shelf: json["shelf"],

  );
}