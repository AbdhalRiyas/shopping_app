import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_treinetic/models/product.dart';
import 'package:shopping_app_treinetic/pages/product_detail_screen.dart';
import 'package:shopping_app_treinetic/services/product_services.dart';

class ProductCard extends StatelessWidget {
  final List<Product> productList;
  const ProductCard({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "All Products",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              productList.length,
              (index) => GestureDetector(
                onTap: () {Provider.of<ProductService>(context, listen: false).getProduct(context: context, id: productList[index].id!).whenComplete((){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen()));});},
                child: Container(
                  margin: const EdgeInsets.only(right: 10, left: 20),
                  width: 250,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: Image.network(productList[index].image!)
                                    .image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            productList[index].title.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "\$ ${productList[index].price}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                productList[index].category.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              for (int i = 0;
                                  i < productList[index].rating!.rate!.toInt();
                                  i++)
                                const Icon(Icons.star, color: Colors.amber),
                              Text(
                                "  ${productList[index].rating!.rate}",
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
