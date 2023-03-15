import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RedemptionPage extends StatefulWidget {
  const RedemptionPage({super.key});

  @override
  State<RedemptionPage> createState() => _RedemptionPageState();
}

class _RedemptionPageState extends State<RedemptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: CachedNetworkImage(
                          alignment: Alignment.center,
                          imageUrl: 'https://support.apple.com/library/content/dam/edam/applecare/images/en_US/iphone/iphone-14-pro-max-colors.png',
                          fit: BoxFit.contain,
                          height: 300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildText('Product', 'Name'),
                    _buildText('Price', '100 ฿'),
                    const SizedBox(height: 5),
                    _buildText('Rate', '4 ฿ : 1 point'),
                    const SizedBox(height: 5),
                    _buildText('Total Point', '25 point'),
                    _buildText('Point Balance', '75 point'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.red,
            child: const Center(
              child: Text('Redeem'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String textLeft, String textRight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(textLeft, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(textRight),
            ],
          ),
        ],
      ),
    );
  }
}
