class RestaurantMenuItemModel {
  int id;
  String title;
  String description;
  double price;
  String imageUrl;

  RestaurantMenuItemModel(
      {this.id, this.title, this.price, this.description, this.imageUrl});

  factory RestaurantMenuItemModel.fromJosn(Map<String, dynamic> json) {
    return new RestaurantMenuItemModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        price: json["price"]);
  }
}
