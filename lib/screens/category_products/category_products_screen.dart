import 'package:e_commerce_app_flutter/models/Product.dart';

import 'package:flutter/material.dart';

import 'components/body.dart';

class CategoryProductsScreen extends StatelessWidget {
  final PackageType packageType;

  const CategoryProductsScreen({
    Key key,
    @required this.packageType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        packageType: packageType,
      ),
    );
  }
}
