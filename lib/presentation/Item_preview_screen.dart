import 'package:chalyaar/core/utils/color_constant.dart';
import 'package:chalyaar/models/item_model.dart';
import 'package:chalyaar/theme/app_style.dart';
import 'package:chalyaar/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemPreviewScreen extends StatefulWidget {
  final Item item;
  const ItemPreviewScreen({super.key, required this.item});

  @override
  State<ItemPreviewScreen> createState() => _ItemPreviewScreenState();
}

class _ItemPreviewScreenState extends State<ItemPreviewScreen> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
              child: Text("Home page > ${widget.item.name}",style: AppStyle.txtMontserratRomanRegular14Black54,),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurStyle:BlurStyle.outer,
                    color: Color.fromARGB(22, 0, 0, 0),
                    spreadRadius:0.5,
                    blurRadius: 10
                  )
                ]
              ),
              margin: const EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: FadeInImage.assetNetwork(placeholder: 'assets/logo.png',image:widget.item.imageUrl.toString() ,fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(widget.item.name,style: AppStyle.txtRobotoRegular22Black), 
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              itemSize: 20,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              ignoreGestures: true,
                              onRatingUpdate: (rating) {
                              },
                            ),
                            Text("(12)",style: AppStyle.txtMontserratRomanSemiBold13BlackTiffanyBlue,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("PKR ${widget.item.discountPrice.toString()}",style: AppStyle.txtMontserratBold20Orange,),
                        SizedBox(height:10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("PKR  ${widget.item.price.toString()}",style: AppStyle.txtMontserratRomanMedium12Black54LineThrough,),
                            SizedBox(width: 5,),
                            Text(" ${widget.item.discount.toString()}%(off)",style: AppStyle.txtMontserratRomanMedium12Black54,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Quantity"),
                            SizedBox(width: 20,),
                            ElevatedButton(
                              onPressed: qty>1?(){
                                qty--;
                                setState(() {
                                  
                                });
                              }:null,
                              
                              style: ButtonStyle(
                                
                                textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                                )),
                                minimumSize: MaterialStatePropertyAll<Size>(Size(40,40)),
                                padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                                backgroundColor:MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    
                                    if(states.contains(MaterialState.disabled)){
                                      return Color.fromARGB(124, 234, 234, 234);
                                    }
                                    return Color.fromARGB(45, 230, 180, 30);  // Use the component's default.
                                  },
                                ) ,
                                foregroundColor:MaterialStatePropertyAll<Color>(ColorConstant.orange),
                                shape: const MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder( )),
                                elevation:const MaterialStatePropertyAll(0) ,
                                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if(states.contains(MaterialState.hovered)){
                                      return Color.fromARGB(87, 230, 180, 30);
                                    }
                                    return Color.fromARGB(255, 217, 210, 210);  // Use the component's default.
                                  },
                                ),
                              ),
                              
                              child:const Icon(CupertinoIcons.minus,size: 15,)
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:10,right: 10),
                              child: Text(qty.toString()),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  qty++;
                                });
                              },
                              
                              style: ButtonStyle(
                                
                                textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                                )),
                                minimumSize: MaterialStatePropertyAll<Size>(Size(40,40)),
                                padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                                backgroundColor:const MaterialStatePropertyAll<Color>(Color.fromARGB(45, 230, 180, 30)) ,
                                foregroundColor:MaterialStatePropertyAll<Color>(ColorConstant.orange),
                                shape: const MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder( )),
                                elevation:const MaterialStatePropertyAll(0) ,
                                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if(states.contains(MaterialState.hovered)){
                                      return Color.fromARGB(87, 230, 180, 30);
                                    }
                                    return Color.fromARGB(255, 217, 210, 210);  // Use the component's default.
                                  },
                                ),
                              ),
                              
                              child:const Icon(CupertinoIcons.add,size: 15,)
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: Size(150, 40),
                                backgroundColor: ColorConstant.tiffanyBlue,
                                shape: RoundedRectangleBorder(),
                                foregroundColor: ColorConstant.customWhite
                              ),
                              onPressed: (){},
                              child: Text("Buy Now")
                            ),
                            SizedBox(width: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: Size(150, 40),
                                backgroundColor: ColorConstant.orange,
                                shape: RoundedRectangleBorder(),
                                foregroundColor: ColorConstant.customWhite
                              ),
                              onPressed: (){},
                              child: Text("Add to cart")
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}