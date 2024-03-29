import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Map<String, Object> product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedsize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
        ),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_back_ios_new),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Image.asset(widget.product['imageUrl'] as String),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: ((context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedsize = size;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Chip(
                              backgroundColor: selectedsize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : const Color.fromRGBO(245, 247, 249, 1),
                              label: Text(size.toString()),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Add To Cart",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
