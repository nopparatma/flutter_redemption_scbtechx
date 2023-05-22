import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redemption_scbtechx/services/redemption_service.dart';
import 'package:flutter_redemption_scbtechx/ui/shared/theme.dart';
import 'package:flutter_redemption_scbtechx/utillties/string_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../bloc/application/application_bloc.dart';
import '../../bloc/redemption/redemption_bloc.dart';
import '../../models/product_data_rs.dart';
import '../../models/user_data_rs.dart';
import '../router.dart';
import '../widget/custom_dropdown_button.dart';

enum Sort { price, rate }

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<String> items = [
    'Sort : Price',
    'Sort : Rate',
  ];

  String? selectedValue;

  @override
  void initState() {
    super.initState();

    context.read<RedemptionBloc>().add(SortDataEvent());
  }

  @override
  dispose() {
    super.dispose();
  }

  onChangedSort(String value) {
    if (value.contains('Price')) {
      context.read<RedemptionBloc>().add(SortDataEvent(sortMode: Sort.price));
    } else if (value.contains('Rate')) {
      context.read<RedemptionBloc>().add(SortDataEvent(sortMode: Sort.rate));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('INIT_PRODUCT_LIST'),
      appBar: AppBar(
        title: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            CustomerData? custData = state.userSession?.userDataRs?.customerData;
            if (custData != null) {
              return Row(
                key: const Key('SHOW_PRODUCT_LIST'),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(custData.name ?? ''),
                  Text('${StringUtil.getDisplayNumber(state.remainPointAmt())} Point'),
                ],
              );
            }

            return Container(
              key: const Key('NOT_SHOW_PRODUCT_LIST'),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDropdownButton(
                  hint: 'Sort',
                  dropdownItems: items,
                  value: selectedValue,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onChanged: (value) {
                    onChangedSort(value ?? '');
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
          BlocBuilder<RedemptionBloc, RedemptionState>(
            builder: (context, state) {
              if (state is LoadingRedemptionState) {
                return Expanded(
                  child: Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      color: Colors.deepPurple,
                      size: 100,
                    ),
                  ),
                );
              } else if (state is SuccessSortDataState && state.products != null) {
                return Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: state.products?.map((e) => _buildProductItem(e)).toList() ?? [],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(Product productItem) {
    return Card(
      elevation: 5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RoutePaths.productDetailPage, arguments: {'productItem': productItem});
        },
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(5),
          shadowColor: Colors.deepPurple,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              alignment: Alignment.center,
              imageUrl: '${productItem.image}',
              fit: BoxFit.contain,
              height: 100,
              errorWidget: (context, url, error) {
                return Container(color: Colors.grey);
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    productItem.name ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.xNormal.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price : ${StringUtil.getDisplayNumber(productItem.price ?? 0)}', style: const TextStyle(color: Colors.black)),
                Text('Rate : ${StringUtil.getDisplayNumber(productItem.rateBahtPerPoint ?? 0)} Baht/Point', style: const TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
