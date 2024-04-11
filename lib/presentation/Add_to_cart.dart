import 'package:chalyaar/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Text("You don't have any items in your cart. Let's get shopping!")
                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}