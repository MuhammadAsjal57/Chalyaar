import 'package:chalyaar/core/utils/Image_constant.dart';
import 'package:flutter/material.dart';

class MobileCustomAppBar extends StatelessWidget {
  const MobileCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
     
      centerTitle: true,
      pinned: false,
      surfaceTintColor: Colors.white,
      toolbarHeight: 80,
      title: Image.asset(ImageConstant.chalYaarLogo,width: 120,),
      
    );
  }
}