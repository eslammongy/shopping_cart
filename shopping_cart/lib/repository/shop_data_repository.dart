import 'package:shopping_cart/model/shopping.dart';

class ShopDataProvider {
  Future<ShoppingData> getShoppingItems() async {
    List<ShopCardItem> shopcardItems = [
      ShopCardItem(
        imageUrl:
            "https://images.yaoota.com/VLqazEm1P6UzY_ynCyB-XP5ZQAo=/trim/yaootaweb-production-sa/media/crawledproductimages/490f06b268be7b832b3b98e5f31b504291cd90f9.jpg",
        price: 22,
        quantity: 1,
        title: 'Beats Pill',
        thumbnail:
            'https://images.yaoota.com/VLqazEm1P6UzY_ynCyB-XP5ZQAo=/trim/yaootaweb-production-sa/media/crawledproductimages/490f06b268be7b832b3b98e5f31b504291cd90f9.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU",
        price: 50,
        quantity: 1,
        title: 'Headpone',
        thumbnail:
            'https://images-eu.ssl-images-amazon.com/images/I/517JoJtwtdL._AC_UL600_SR600,600_.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU",
        price: 80.12,
        quantity: 1,
        title: 'Mouse',
        thumbnail:
            'https://thermaltake.azureedge.net/pub/media/catalog/product/cache/e4fc6e308b66431a310dcd4dc0838059/l/2/l20m01.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU",
        price: 30.12,
        quantity: 1,
        title: 'Mouse',
        thumbnail:
            'https://cdn.shopify.com/s/files/1/2695/9506/products/m686gamingmouse_1_450x450.png?v=1584694789',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU",
        price: 980.12,
        quantity: 1,
        title: 'ASUS ROG',
        thumbnail: 'https://cdn.mwave.com.au/images/65/AC24003.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU",
        price: 1005.6,
        quantity: 1,
        title: 'Samsung Gaming',
        thumbnail:
            'https://cdn.mwave.com.au/images/midimage/samsung_lc27rg50fqexxy_27_240hz_fhd_va_curved_gsync_compatible_gaming_monitor_ac27407_1.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU",
        price: 100.12,
        quantity: 1,
        title: 'Gaming Keyboard',
        thumbnail:
            'https://cdn.mwave.com.au/images/midimage/logitech_g_pro_x_tkl_modular_mechanical_gaming_keyboard_shroud_edition_ac43208.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://images.yaoota.com/VLqazEm1P6UzY_ynCyB-XP5ZQAo=/trim/yaootaweb-production-sa/media/crawledproductimages/490f06b268be7b832b3b98e5f31b504291cd90f9.jpg",
        price: 22,
        quantity: 1,
        title: 'Beats Pill',
        thumbnail:
            'https://images.yaoota.com/VLqazEm1P6UzY_ynCyB-XP5ZQAo=/trim/yaootaweb-production-sa/media/crawledproductimages/490f06b268be7b832b3b98e5f31b504291cd90f9.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU",
        price: 50,
        quantity: 1,
        title: 'Headpone',
        thumbnail:
            'https://images-eu.ssl-images-amazon.com/images/I/517JoJtwtdL._AC_UL600_SR600,600_.jpg',
      ),
      ShopCardItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU",
        price: 80.12,
        quantity: 1,
        title: 'Mouse',
        thumbnail:
            'https://thermaltake.azureedge.net/pub/media/catalog/product/cache/e4fc6e308b66431a310dcd4dc0838059/l/2/l20m01.jpg',
      ),
    ];

    return await ShoppingData(shoppingItems: shopcardItems);
  }

  Future<ShoppingData> getCardItems() async {
    List<ShopCardItem> shopcardItems = [];

    return await ShoppingData(shoppingItems: shopcardItems);
  }
}
