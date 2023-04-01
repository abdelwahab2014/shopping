import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/controller.dart';

class FavoriteProduct extends StatefulWidget {
  const FavoriteProduct(
      {super.key,
      required this.productName,
      required this.productImage,
      required this.productPrice});
  final String productName;
  final String productImage;
  final int productPrice;

  @override
  State<FavoriteProduct> createState() => _ProductState();
}

class _ProductState extends State<FavoriteProduct> {
  final Controller controller = Get.put(Controller());
  bool isFavorite = false;
  int quantity = 0;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void addToCart() {
    setState(() {
      controller.productQuantityCount = controller.productQuantityCount + 1;
    });
  }

  void removeFromCart() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeigh = MediaQuery.of(context).size.height;

    double padding = screenWidth * 0.02;
    return SizedBox(
      width: screenWidth,
      //height: 10, //screenWidth > 392 ? screenWidth * 2 : screenWidth * 0.2,
      child: Card(
        elevation: 5,
        // color: Color.fromARGB(255, 239, 238, 234),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.productImage,
                  width: screenWidth,
                  height:
                      screenWidth > 392 ? screenWidth / 1.5 : screenWidth / 1.5,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: padding * 0.5,
                  right: screenWidth > 392 ? padding * 1.5 : padding * 2,
                  child: GestureDetector(
                    onTap: () {
                      toggleFavorite();
                      isFavorite
                          ? controller.addToFavorite(widget.productImage,
                              widget.productName, widget.productPrice)
                          : controller.removeFormFavorite(widget.productImage,
                              widget.productName, widget.productPrice);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.favorite_rounded,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            // FavoriteProduct INFO
            SizedBox(
              height: padding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // FavoriteProduct Name & Price
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.productName),
                    SizedBox(
                      height: padding,
                    ),
                    Text(widget.productPrice.toString()),
                  ],
                ),
                // FavoriteProduct Cart
                GestureDetector(
                  onTap: () {
                    if (controller.cartProductsNames
                        .contains(widget.productName)) {
                      Get.snackbar("Error", "Already exist");
                    } else {
                      controller.addToCart(widget.productImage,
                          widget.productName, widget.productPrice);
                    }
                  },
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    size: padding * 4,
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
