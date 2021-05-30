class ShopCardItem {
  String imageUrl;
  String thumbnail;
  String title;
  double price;
  int quantity;

  ShopCardItem({
    this.imageUrl,
    this.price,
    this.quantity,
    this.title,
    this.thumbnail,
  });
}

class ShoppingData {
  List<ShopCardItem> shoppingItems;

  ShoppingData({this.shoppingItems});
  void addProduct(ShopCardItem p) {
    shoppingItems.add(p);
  }

  void removeProduct(ShopCardItem p) {
    shoppingItems.add(p);
  }
}
