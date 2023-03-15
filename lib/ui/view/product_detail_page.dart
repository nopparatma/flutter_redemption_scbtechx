import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: Text('x,xxx Point', textAlign: TextAlign.right)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 5,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              alignment: Alignment.center,
                              imageUrl: 'https://support.apple.com/library/content/dam/edam/applecare/images/en_US/iphone/iphone-14-pro-max-colors.png',
                              fit: BoxFit.contain,
                              height: 300,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  children: <Widget>[
                                    Positioned(
                                      child: IconButton(
                                        iconSize: 55,
                                        icon: const Icon(
                                          Icons.star,
                                          color: Colors.black54,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 50,
                                      icon: const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              _buildText('Price', 'Rate'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('''MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006. The American multinational corporation created MacBook computers when it consolidated its PowerBook and iBook lines during its transition to Intel processor-based products. As of 2013, there are two types of MacBook computers: the base-level MacBook Air and the upper-level MacBook Pro.
                        MacBook is a term used for a brand of Mac notebook computers that Apple started producing in 2006. The American multinational corporation created MacBook computers when it consolidated its PowerBook and iBook lines during its transition to Intel processor-based products. As of 2013, there are two types of MacBook computers: the base-level MacBook Air and the upper-level MacBook Pro.''', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: const Center(
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String textLeft, String textRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textLeft, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(textRight, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
