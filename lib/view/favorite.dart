import 'package:shop/model/import.dart';
import 'package:shop/widgets/products/favorite_product.dart';
//import 'package:shop/model/info.dart';
//import 'package:shop/widgets/products/product.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _HomeState();
}

class _HomeState extends State<Favorite> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: GridView.builder(
              itemCount: controller.favoriteProductsNames.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 10, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return FavoriteProduct(
                  productName: controller.favoriteProductsNames[index].toString(),
                  productImage: controller.favoriteProductsImages[index].toString(),
                  productPrice: controller.favoriteProductsPrices[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
