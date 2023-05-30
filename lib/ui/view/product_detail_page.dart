import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/bloc/application/application_bloc.dart';
import 'package:flutter_redemption_scbtechx/models/product_data_rs.dart';
import 'package:flutter_redemption_scbtechx/ui/shared/theme.dart';
import 'package:flutter_redemption_scbtechx/ui/widget/custom_button.dart';

import '../../models/view/user_session_dto.dart';
import '../../utillties/string_util.dart';
import '../router.dart';

class ProductDetailPage extends StatefulWidget {
  final Product productItem;

  const ProductDetailPage({super.key, required this.productItem});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool get isSoldOut => ((widget.productItem.stock ?? 0) <= 0);

  num get remainPointAmt => BlocProvider.of<ApplicationBloc>(context).state.remainPointAmt();

  onPressedStar(bool isCurrentStateFavorite) {
    UserSessionDto? userSessionDto = BlocProvider.of<ApplicationBloc>(context).state.userSession;
    List<Product> favoriteProducts = userSessionDto?.favoriteProducts ?? [];

    if (isCurrentStateFavorite) {
      favoriteProducts.remove(widget.productItem);
    } else {
      favoriteProducts.add(widget.productItem);
    }

    userSessionDto?.favoriteProducts = favoriteProducts;

    context.read<ApplicationBloc>().add(ApplicationUpdateStateModelEvent(userSession: userSessionDto));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text('${StringUtil.getDisplayNumber(remainPointAmt)} Point', textAlign: TextAlign.right)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
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
                              Center(
                                child: widget.productItem.image == null || widget.productItem.image == ''
                                    ? Container(
                                        color: Colors.grey,
                                        height: 100,
                                      )
                                    : Image.network(
                                        widget.productItem.image ?? '',
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                        height: 300,
                                        errorBuilder: (context, url, error) {
                                          return Container(color: Colors.grey);
                                        },
                                      ),
                              ),
                              BlocBuilder<ApplicationBloc, ApplicationState>(
                                builder: (context, state) {
                                  bool isFavoriteProduct = state.isFavoriteProduct(widget.productItem);

                                  return Row(
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
                                            icon: Icon(
                                              Icons.star,
                                              color: isFavoriteProduct ? Colors.yellow : Colors.grey,
                                            ),
                                            onPressed: () {
                                              onPressedStar(isFavoriteProduct);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.productItem.name ?? '',
                                        style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                _buildText(
                                  StringUtil.getDisplayNumber(widget.productItem.price ?? 0),
                                  StringUtil.getDisplayNumber(widget.productItem.rateBahtPerPoint ?? 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            widget.productItem.description ?? '',
                            style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isSoldOut
                ? CustomButton(
                    text: 'Sold Out',
                    color: Colors.grey,
                    onPressed: () {},
                  )
                : CustomButton(
                    text: 'Next',
                    color: Colors.green,
                    onPressed: () {
                      Navigator.of(context).pushNamed(RoutePaths.redemptionPage, arguments: {'productItem': widget.productItem});
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String textLeft, String textRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(textLeft, style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold)),
        Text('$textRight Bath : 1 Point', style: Theme.of(context).textTheme.normal.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
