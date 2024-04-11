
import 'package:another_flushbar/flushbar.dart';
import 'package:chalyaar/core/utils/color_constant.dart';
import 'package:chalyaar/core/utils/size_utils.dart';
import 'package:chalyaar/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DialogConstant{
  
  static showLoading(BuildContext context){
    const spinkit = SpinKitSquareCircle(
      color: Colors.white,
      size: 50.0,
      
    );
    showDialog(
      barrierDismissible: false,
      
      context: context, builder: (_){
      
      return spinkit;
    });
  }

  static showAdsLoading(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (_){
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(), // Show a loading indicator
                  SizedBox(width: getHorizontalSize(10)),
                  Text('Loading ad...'),
            ],
          ),
        ),
      );
    });
  }

   
  
  static Future showSnackBar(BuildContext context,[String message="Success!",double marginleft=125,double marginRight=125,int duration=1] ) async {
    final snackBar = SnackBar(
      duration:  Duration(seconds: duration),
      behavior: SnackBarBehavior.floating,
      
      content: Align(
        alignment: Alignment.topCenter,
        child: Center(
          child: Text(message,  style: AppStyle.txtMontserratRomanSemiBold14WhiteA700,
        )),
      ),
      margin: getMargin(
        bottom: MediaQuery.of(context).size.height/ 2.2,
        left: marginleft,
        right: marginRight,
      ),
      elevation: 0,
    );
    return await ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static Future showSnackBar2(BuildContext context,[String message="Success!",double marginleft=125,double marginRight=125,int duration=200] ) async {
    
    await Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(getSize(8)),
      margin: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20),top: getHorizontalSize(20)),
      messageText: Text(message,overflow: TextOverflow.ellipsis,maxLines: 3,style: AppStyle.txtMontserratRomanRegularWhite12,),
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: ColorConstant.red700,
        ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: ColorConstant.red700,
      )..show(context);
  }
  static Future showSnackBar3(BuildContext context ) async {
    
    await Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      
      flushbarStyle: FlushbarStyle.GROUNDED,
      borderRadius: BorderRadius.circular(getSize(8)),
      margin: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20),top: getHorizontalSize(20)),
      messageText: Text("Text copy successfully",overflow: TextOverflow.ellipsis,maxLines: 3,style: AppStyle.txtMontserratRomanRegularWhite12,),
      icon: Icon(
        Icons.verified_outlined,
        size: 28.0,
        color: ColorConstant.orange,
        ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: ColorConstant.orange,
      )..show(context);
  }
  static Widget ShowIndicator(BuildContext context ) {
    final spinkit = SpinKitSquareCircle(
      color: Colors.black,
      size: 50.0,
    );
    return spinkit;
  }
}