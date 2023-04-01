import 'package:shop/model/import.dart';
import 'package:shop/model/info.dart';
import 'package:shop/widgets/products/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              itemCount: productsImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Product(
                  productName: productsNames[index],
                  productImage: productsImages[index],
                  productPrice: productsPrices[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
