import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chalyaar/core/utils/Image_constant.dart';
import 'package:chalyaar/core/utils/color_constant.dart';
import 'package:chalyaar/core/utils/responsive.dart';
import 'package:chalyaar/core/utils/size_utils.dart';
import 'package:chalyaar/models/item_model.dart';
import 'package:chalyaar/presentation/Item_preview_screen.dart';
import 'package:chalyaar/theme/app_style.dart';
import 'package:chalyaar/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
 List<bool> isHovered = List.generate(6, (index) => false);
 bool isHover=false;
 int currentIndex=-1;
 late AnimationController controller;
 @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  SliverPersistentHeader makeHeader(String headerTitle) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight:70.0,
        maxHeight: 200.0,
        child: Container(
            color: Colors.lightBlue, child: Center(child: Text(headerTitle))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:CustomScrollView(   
        slivers: [
          if(Responsive.isDesktop(context))CustomAppBar(),
          if(Responsive.isMobile(context))...[
            makeHeader("headerTitle"),
          ],
          SliverToBoxAdapter(
            child: CustomCarouselSlider()
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories",style: AppStyle.txtMontserratSemiBold18Black54,),
                  SizedBox(height: 20,),
                  Wrap(
                    spacing: 5,
                    children:List.generate(6, (index) {
                        return ClipOval(
                          child: MouseRegion(
                          onHover: (event) {
                            // Handle hover event
                            setState(() {
                              // Set a boolean variable to indicate hover state
                              isHovered[index] = true;
                              controller.forward(from: 0.0);
                            });
                          },
                          onExit: (event) {
                            // Handle hover exit event
                            setState(() {
                              // Set the boolean variable back to false when hover exits
                              isHovered[index] = false;
                              controller.reverse();
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              // Handle tap event if needed
                            },
                            child: Stack(
                              children: [
                                Container( 
                                  color: ColorConstant.customWhite,
                                  width:Responsive.isMobile(context)?width*.25:Responsive.isTablet(context)?width*.18: width* .15,
                                  height: Responsive.isMobile(context)?width* .25:Responsive.isTablet(context)?width*.18: width* .15,
                                  padding: EdgeInsets.all(20),
                                  child: Image.asset(
                                    ImageConstant.productPng,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned.fill(
                                  child: AnimatedOpacity(
                                    opacity: isHovered[index] ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 200),
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(0.0, 1.0), // Start from bottom
                                        end: Offset.zero,
                                      ).animate(
                                        CurvedAnimation(
                                          parent: controller,
                                          curve: Curves.easeInOut,
                                        ),
                                      ),
                                      child: Container(
                                        width: 190,
                                        height: 190,
                                        color: Colors.black.withOpacity(0.5),
                                        child: Center(
                                          child: Text(
                                            'Watch',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),                                                 
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(Responsive.isMobile(context)?10: 40),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Top Rated Products",style: AppStyle.txtMontserratSemiBold18Black54,),
                        Text("See More",style: AppStyle.txtMontserratBold16Orange,)
                      ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height:Responsive.isMobile(context)? height*.30:height*.55,
                    padding: EdgeInsets.all(Responsive.isMobile(context)?10: 20),
                    color: ColorConstant.customWhite,
                    
                    child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width:Responsive.isMobile(context)?5: 10,),
                    scrollDirection: Axis.horizontal,
                    
                    itemCount: Item.itemList.length,
                    itemBuilder: (context,index){
                      return  AnimatedContainer(
                        
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(Responsive.isMobile(context)?5: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurStyle:BlurStyle.outer,
                              color:currentIndex==index? Color.fromARGB(73, 0, 0, 0): Color.fromARGB(22, 0, 0, 0),
                              spreadRadius:currentIndex==index?0.7: 0.1,
                              blurRadius: 10
                            )
                          ]
                        ),
                        width:Responsive.isMobile(context)? width*.30:width*.175,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemPreviewScreen(item: Item.itemList[index],)));
                            });
                          },
                            onHover: (value) {
                            if(value){
                              setState(() {
                                isHover=value;
                                currentIndex=index;
                              });
                            }else{
                              setState(() {
                                isHover=value;
                                currentIndex=-1;
                              });
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:Responsive.isMobile(context)? width*.30:width*.28,
                                height:Responsive.isMobile(context)?height*.12:height*.31,
                                child: FadeInImage.assetNetwork(placeholder: 'assets/logo.png',image:Item.itemList[index].imageUrl.toString() ,),
                              ),
                              SizedBox(height: 5,),
                              AutoSizeText(Item.itemList[index].name,overflow: TextOverflow.ellipsis,maxLines: 2,),
                              SizedBox(height: 5,),
                              AutoSizeText("PKR ${Item.itemList[index].discountPrice.toString()}",style: AppStyle.txtMontserratBold16Orange,maxLines: 1,),
                              Wrap(
                                children: [
                                  AutoSizeText("PKR  ${Item.itemList[index].price.toString()}",style: AppStyle.txtMontserratRomanMedium12Black54LineThrough,maxLines: 1,),
                                  SizedBox(width: 5,),
                                  AutoSizeText(" ${Item.itemList[index].discount.toString()}%(off)",style: AppStyle.txtMontserratRomanMedium12Black54,maxLines: 1,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
              
                    }),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding:EdgeInsets.all(Responsive.isMobile(context)?10: 40),
              width:width,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Just for you",style: AppStyle.txtMontserratSemiBold18Black54,),
                        Text("See More",style: AppStyle.txtMontserratBold16Orange,)
                      ],
                  ),
                  SizedBox(height: 20,),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children:List.generate(Item.JustForUList.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurStyle:BlurStyle.outer,
                              color:currentIndex==index? Color.fromARGB(73, 0, 0, 0): Color.fromARGB(22, 0, 0, 0),
                              spreadRadius:currentIndex==index?0.7: 0.1,
                              blurRadius: 10
                            )
                          ]
                        ),
                        width:Responsive.isMobile(context)? width/2.2:width*.18,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemPreviewScreen(item: Item.JustForUList[index],)));
                            });
                          },
                            onHover: (value) {
                            if(value){
                              setState(() {
                                isHover=value;
                                currentIndex=index;
                              });
                            }else{
                              setState(() {
                                isHover=value;
                                currentIndex=-1;
                              });
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: FadeInImage.assetNetwork(placeholder: 'assets/logo.png',image:Item.JustForUList[index].imageUrl.toString() ,),
                              ),
                              SizedBox(height: 5,),
                              Text(Item.JustForUList[index].name,overflow: TextOverflow.ellipsis,maxLines: 2,),
                              SizedBox(height: 5,),
                                Text("PKR ${Item.JustForUList[index].discountPrice.toString()}",style: AppStyle.txtMontserratBold16Orange,),
                              Wrap(
                                children: [
                                  Text("PKR  ${Item.JustForUList[index].price.toString()}",style: AppStyle.txtMontserratRomanMedium12Black54LineThrough,),
                                  SizedBox(width: 5,),
                                  Text(" ${Item.JustForUList[index].discount.toString()}%(off)",style: AppStyle.txtMontserratRomanMedium12Black54,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ],)
      );
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight+40;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
      
        buildBackground(shrinkOffset),
        Hero(
          tag: 1,
          child: AnimatedOpacity(
            duration: Duration(microseconds: 500),
            opacity: appear(shrinkOffset),
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              padding: getPadding(top: 40,right: 10,left: 10,bottom: 5),
              color: Colors.white,
              child:buildAppBar(shrinkOffset),
            ),
          ),
        )
      ],
    );
  }
  
  double appear(double shrink)=>shrink/maxExtent;
  double disappear(double shrink)=>1-shrink/maxExtent;
  Widget buildAppBar(double shrink)=>  Row(
      children: [
        Expanded(
          flex: 3,
          child:  TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 14,
                ),
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.orange,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12))
                  ),
                  child: Icon(Icons.search,size: 20,color: ColorConstant.customWhite,)),
                contentPadding: getPadding(left: 10,right: 10,),
                filled: true,
                fillColor:ColorConstant.customWhite,
                hintText: "Search in ChalYaar",
                border: OutlineInputBorder(
                  
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)
                )
              ),
            ),
          
        ),
        CustomCartButton(imagePath: ImageConstant.basketPng,),
        CustomCartButton(iconPath: Icons.notifications,)
      ],
    
  );
  Widget buildBackground(double shrink)=>Hero(
    tag: 1,
    child: AnimatedOpacity(
      duration: Duration(microseconds: 500),
      opacity: disappear(shrink),
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        padding: getPadding(top: 40,left: 20,right: 20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(ImageConstant.chalYaarLogo,width: 140,)),
            Expanded(
              flex: 3,
              child: buildAppBar(shrink))
          ],
        ),
      )
    ),
  );

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
          minHeight != oldDelegate.minHeight ||
          child != oldDelegate.child;
  }
}

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height:Responsive.isDesktop(context)? 400:200,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeIn,
              scrollPhysics: NeverScrollableScrollPhysics()
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ColorConstant.customWhite
                  ),
                  child: Center(child: Image.asset(ImageConstant.logoC,width: 150,))
                );
              },
            );
          }).toList(),
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomNavigationSliderController(onTap: () => _controller.previousPage(),icon: FaIcon(FontAwesomeIcons.arrowLeft,size: 15,),),
            CustomNavigationSliderController(onTap: () => _controller.previousPage(),icon: FaIcon(FontAwesomeIcons.arrowRight,size: 15,),),
          ],
        )
      ],
    );
  }
}

class CustomNavigationSliderController extends StatelessWidget {
  
  const CustomNavigationSliderController({
    super.key, this.onTap, required this.icon,
  });
  final Widget icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style:ButtonStyle(
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(getPadding(all: 0)),
        backgroundColor:MaterialStatePropertyAll<Color>(ColorConstant.orange) ,
        foregroundColor:MaterialStatePropertyAll<Color>(ColorConstant.white),
        shape: const MaterialStatePropertyAll<OutlinedBorder>(OvalBorder()),
        shadowColor: MaterialStatePropertyAll<Color>(Colors.black),
        elevation: MaterialStatePropertyAll(3),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if(states.contains(MaterialState.hovered)){
              return const Color.fromARGB(26, 255, 255, 255);
            }
            return const Color.fromARGB(61, 255, 255, 255);  // Use the component's default.
          },
        ),
      ),
      onPressed: onTap,
      icon: icon
    );
  }
}
