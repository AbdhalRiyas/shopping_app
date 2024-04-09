import 'package:flutter/material.dart';
import 'package:shopping_app_treinetic/models/product.dart';
import 'package:shopping_app_treinetic/pages/product_detail_screen.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image.network(
//                 product.imageUrl),
//             Text(product.title),
//             Text(product.price),
//             Text(product.category),
//             Row(
//               children: [
//                 for (int i = 0; i < product.rating; i++)
//                   const Icon(Icons.star, color: Colors.amber),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProductCard extends StatelessWidget {
  // title, product image, price, category and rate.
  const ProductCard({
    super.key,
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
              padding: const EdgeInsets.only(left: 20),
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
              product.length,
              (index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(product: product[index]),
                  ),
                ),
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
                                image: Image.network(product[index].imageUrl)
                                    .image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product[index].title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "${product[index].price}",
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
                                product[index].category,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < product[index].rating; i++)
                                const Icon(Icons.star, color: Colors.amber),
                              Text(
                                "  ${product[index].rating}",
                                style: TextStyle(fontSize: 15),
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
