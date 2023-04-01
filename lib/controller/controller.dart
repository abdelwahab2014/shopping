import 'package:shop/model/info.dart';

import '../model/import.dart';

class Controller extends GetxController {
  var pageIndex = 0.obs;
  var productQuantityCount = 0.obs;
  var favoriteProductCount = 0.obs;
  // add to cart
  List cartProductsImages = [].obs;
  List cartProductsNames = [].obs;
  List cartProductsPrices = [].obs;
  List cartProductsQuanity = [].obs;

  addToCart(String productImage, String productname, int productPrice) {
    cartProductsImages.add(productImage);
    cartProductsNames.add(productname);
    cartProductsPrices.add(productPrice);
    productQuantityCount = productQuantityCount + 1;
  }

  // Add to Favorite
  List favoriteProductsImages = [].obs;
  List favoriteProductsNames = [].obs;
  List favoriteProductsPrices = [].obs;
  addToFavorite(String productImage, String productname, int productPrice) {
    favoriteProductsImages.add(productImage);
    favoriteProductsNames.add(productname);
    favoriteProductsPrices.add(productPrice);
    favoriteProductCount = favoriteProductCount + 1;
  }

  // Remove from Favorite
  removeFormFavorite(
      String productImage, String productname, int productPrice) {
    favoriteProductsImages.remove(productImage);
    favoriteProductsNames.remove(productsNames);
    favoriteProductsPrices.remove(productPrice);
    favoriteProductCount = favoriteProductCount - 1;
  }
}
