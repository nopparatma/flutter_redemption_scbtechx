import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/product_data_rs.dart';
import '../../utillties/string_util.dart';

class SummaryPanel extends StatelessWidget {
  final Product productItem;
  final num pointUsed;
  final num pointBalance;

  const SummaryPanel({super.key, required this.productItem, required this.pointUsed, required this.pointBalance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: CachedNetworkImage(
                    alignment: Alignment.center,
                    imageUrl: productItem.image ?? '',
                    fit: BoxFit.contain,
                    height: 300,
                    errorWidget: (context, url, error) {
                      return Container(color: Colors.grey);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildText('Product', productItem.name ?? ''),
              _buildText('Price', '${StringUtil.getDisplayNumber(productItem.price ?? 0)} Baht'),
              const SizedBox(height: 5),
              _buildText('Rate', '${StringUtil.getDisplayNumber(productItem.rateBahtPerPoint ?? 0)} Baht : 1 point'),
              const SizedBox(height: 5),
              _buildText('Total Point', '${StringUtil.getDisplayNumber(pointUsed)} point'),
              _buildText('Point Balance', '${StringUtil.getDisplayNumber(pointBalance)} point'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildText(String textLeft, String textRight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textLeft, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(textRight),
        ],
      ),
    );
  }
}
