import 'package:chalyaar/core/utils/Image_constant.dart';
import 'package:chalyaar/core/utils/color_constant.dart';
import 'package:chalyaar/core/utils/size_utils.dart';
import 'package:chalyaar/presentation/Add_to_cart.dart';
import 'package:chalyaar/theme/app_style.dart';
import 'package:chalyaar/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    final text="Please enter your Phone Number or Email";
    return SliverAppBar(
      toolbarHeight: height*.13,
      pinned: true,
      floating: true,
      snap: true,
      leadingWidth:width*.2 ,
      leading: Padding(
        padding: EdgeInsets.only(left: getSize(50),right: getSize(20),top: 10,bottom: 10),
        child: Image.asset(ImageConstant.chalYaarLogoWhite),
      ),
      shadowColor: Colors.black,
      backgroundColor: Color.fromARGB(255, 40, 40, 43),
      surfaceTintColor: Color.fromARGB(255, 0, 0, 1),
      actions: [            
        ElevatedButton.icon(
          onPressed: ()async{
            await LoginDialogBox(context, _formKey, height, text);
          },
          icon: const Icon(CupertinoIcons.profile_circled,size: 20,),
          label:const Text("Login"),
          style: ButtonStyle(
            textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
            )),
            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(getPadding(top: 18,bottom: 18,left: 3,right: 3)),
            backgroundColor: MaterialStatePropertyAll<Color>(ColorConstant.orange) ,
            foregroundColor:MaterialStatePropertyAll<Color>(ColorConstant.customWhite),
             shape: const MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(12)) )),
            elevation:const MaterialStatePropertyAll(0) ,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if(states.contains(MaterialState.hovered)){
                  return const Color.fromARGB(26, 255, 255, 255);
                }
                return const Color.fromARGB(61, 255, 255, 255);  // Use the component's default.
              },
            ),
          )
        ),
        SizedBox(width: getVerticalSize(10),),
        Container(
          width: getHorizontalSize(0.8),
          height: getVerticalSize(25),
          color: ColorConstant.orange,
        ),
        SizedBox(width: getVerticalSize(10),),
        ElevatedButton(
          onPressed: ()async{
            await showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(),
                contentPadding: EdgeInsets.all(20),
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
              content: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    right: -80,
                    top: -30,
                    child: InkResponse(
                      onTap: () { 
                        Navigator.of(context).pop();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(171, 173, 163, 163),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Text("Create your chalyaar account",style: AppStyle.txtMontserratSemiBold18Black,),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text("Full name*",style: AppStyle.txtMontserratRomanSemiBold11Black,),
                                  SizedBox(height: 3,),
                                  CustomTextFormField(height: height, text: "Enter your first and last name"),
                                  
                                  Text("Phone Number*",style: AppStyle.txtMontserratRomanSemiBold11Black,),
                                  SizedBox(height: 3,),
                                  CustomTextFormField(height: height, text: "Please enter your phone number"),
                                  Text("Verfication Code from whatsApp*",style: AppStyle.txtMontserratRomanSemiBold11Black,),
                                  SizedBox(height: 3,),
                                  CustomTextFormField(
                                    height: height,
                                    text: "Verfication Code",
                                    suffixIcon:Padding(
                                      padding: const EdgeInsets.only(top: 3,bottom: 3,right: 2,),
                                      child: TextButton(onPressed: (){}, child: Text("Send")),
                                    ),
                                  ),
                                  Text("Password*",style: AppStyle.txtMontserratRomanSemiBold11Black,),
                                  SizedBox(height: 3,),
                                  CustomTextFormField(height: height, text: "Minimum 6 characters with a number and a letter"),
                                  
                                ],
                              ),
                            ),
                          ),
                          
                          SizedBox(width: 40,),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Gender*",style: AppStyle.txtMontserratRomanSemiBold11Black,),
                                  SizedBox(height: 3,),
                                  SegmentedButtonGenders(),
                                  SizedBox(height: 40,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      fixedSize: Size(300, 50),
                                      backgroundColor: ColorConstant.orange,
                                      shape: RoundedRectangleBorder(),
                                      foregroundColor: ColorConstant.customWhite
                                    ),
                                    onPressed: (){},
                                    child: Text("SIGN UP")
                                  ),
                                  SizedBox(height: 5,),
                                  Text("By clicking “SIGN UP”, I agree to Chalyaar's Terms\n of Use and Privacy Policy",style:AppStyle.txtMontserratRomanSemiBold11Black54,),
                                  SizedBox(height: 15,),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("Or, sign up with",style:AppStyle.txtMontserratRomanRegular10,)                                
                                  ),
                                  SizedBox(height: 15,),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        fixedSize: Size(150, 40),
                                        backgroundColor: ColorConstant.googleColor,
                                        shape: RoundedRectangleBorder(),
                                        foregroundColor: ColorConstant.customWhite
                                      ),
                                      onPressed: (){},
                                      icon: Image.asset(ImageConstant.googleLogo,width: 20,),
                                      label: Text("Google")
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Already member?",style: AppStyle.txtMontserratRomanRegular10black,),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          textStyle: TextStyle(
                                            fontSize: 11,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500
                                          ),
                                          shape: RoundedRectangleBorder(),
                                          padding: EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                                          foregroundColor: ColorConstant.tiffanyBlue
                                        ),
                                        onPressed: (){}, child: Text("login")
                                      ),
                                      Text("here.",style: AppStyle.txtMontserratRomanRegular10black,),
                                    ],
                                  ),
                                ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
          
          },
          style: ButtonStyle(
            textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
            )),
            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(getPadding(top: 20,bottom: 20,left: 5,right: 5)),
            backgroundColor: MaterialStatePropertyAll<Color>(ColorConstant.orange) ,
            foregroundColor:MaterialStatePropertyAll<Color>(ColorConstant.customWhite),
            shape: const MaterialStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(12)) )),
            elevation:const MaterialStatePropertyAll(0) ,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if(states.contains(MaterialState.hovered)){
                  return const Color.fromARGB(26, 255, 255, 255);
                }
                return const Color.fromARGB(61, 255, 255, 255);  // Use the component's default.
              },
            ),
          ),
          
          child:const Text("Sign Up")
        ),
        
        SizedBox(width: getVerticalSize(20),),
        CustomCartButton(),
          
        SizedBox(width: getVerticalSize(50),),
      ],
        title:SizedBox(
          height: getVerticalSize(48),
          child: TextFormField(
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
      
    );
  }

  Future<void> LoginDialogBox(BuildContext context, GlobalKey<FormState> _formKey, double height, String text) {
    return showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(),
              contentPadding: EdgeInsets.all(20),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
            content: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  right: -80,
                  top: -30,
                  child: InkResponse(
                    onTap: () { 
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color.fromARGB(171, 173, 163, 163),
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text("Welcome to chalyaar",style: AppStyle.txtMontserratSemiBold18Black,),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: _formKey,
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("Phone Number or Email*",style: AppStyle.txtMontserratRomanSemiBold11Black,),
                                SizedBox(height: 3,),
                                CustomTextFormField(height: height, text: text),
                                Text("Password*",style: AppStyle.txtMontserratRomanSemiBold11Black,),
                                SizedBox(height: 3,),
                                CustomTextFormField(height: height, text: "Please enter your Password"),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      textStyle: TextStyle(
                                        fontSize: 11,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500
                                      ),
                                      shape: RoundedRectangleBorder(),
                                      padding: EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                                      foregroundColor: ColorConstant.tiffanyBlue
                                    ),
                                    onPressed: (){}, child: Text("Forgot your password?")
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                        
                        SizedBox(width: 40,),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    fixedSize: Size(300, 50),
                                    backgroundColor: ColorConstant.orange,
                                    shape: RoundedRectangleBorder(),
                                    foregroundColor: ColorConstant.customWhite
                                  ),
                                  onPressed: (){},
                                  child: Text("LOGIN")
                                ),
                                SizedBox(height: 15,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Or, login with",style:AppStyle.txtMontserratRomanRegular10,)                                
                                ),
                                SizedBox(height: 15,),
                                Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      fixedSize: Size(150, 40),
                                      backgroundColor: ColorConstant.googleColor,
                                      shape: RoundedRectangleBorder(),
                                      foregroundColor: ColorConstant.customWhite
                                    ),
                                    onPressed: (){},
                                    icon: Image.asset(ImageConstant.googleLogo,width: 20,),
                                    label: Text("Google")
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("New member?",style: AppStyle.txtMontserratRomanRegular10black,),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        minimumSize: Size.zero,
                                        textStyle: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500
                                        ),
                                        shape: RoundedRectangleBorder(),
                                        padding: EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                                        foregroundColor: ColorConstant.tiffanyBlue
                                      ),
                                      onPressed: (){}, child: Text("Register")
                                    ),
                                    Text("here.",style: AppStyle.txtMontserratRomanRegular10black,),
                                  ],
                                ),
                              ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ));
  }
}

class CustomCartButton extends StatelessWidget {
  final String? imagePath;
  final IconData? iconPath;
  const CustomCartButton({
    super.key, this.imagePath, this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style:ButtonStyle(
        backgroundColor:MaterialStatePropertyAll<Color>(ColorConstant.orange),
        foregroundColor:MaterialStatePropertyAll<Color>(ColorConstant.white),
        shape: const MaterialStatePropertyAll<OutlinedBorder>(OvalBorder()),
        elevation:const MaterialStatePropertyAll(0) ,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if(states.contains(MaterialState.hovered)){
              return const Color.fromARGB(26, 255, 255, 255);
            }
            return const Color.fromARGB(61, 255, 255, 255);  // Use the component's default.
          },
        ),
      ),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddToCartScreen()));
      },
      icon: imagePath!=null?Image.asset(imagePath!,width: 25,):iconPath!=null?Icon(iconPath):Icon(Icons.notification_add)
    );
  }
}




class SegmentedButtonGenders extends StatefulWidget {
  const SegmentedButtonGenders({super.key});

  @override
  State<SegmentedButtonGenders> createState() => _SegmentedButtonGendersState();
}

enum Gender { Male, Female, Others }

class _SegmentedButtonGendersState extends State<SegmentedButtonGenders> {
  Gender genderView = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Gender>(
      style: SegmentedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 238, 238, 238),
        foregroundColor: Colors.black45,
        selectedForegroundColor: Colors.white,
        selectedBackgroundColor: ColorConstant.tiffanyBlue,
        side: BorderSide(color: Colors.black26)
      ),
      segments: const <ButtonSegment<Gender>>[
        ButtonSegment<Gender>(
            value: Gender.Male,
            label: Text('Male'),
            icon: Icon(Icons.male)),
        ButtonSegment<Gender>(
            value: Gender.Female,
            label: Text('Female'),
            icon: Icon(Icons.female)),
        ButtonSegment<Gender>(
            value: Gender.Others,
            label: Text('Others'),
            icon: Icon(Icons.calendar_view_month)),
      ],
      selected: <Gender>{genderView},
      onSelectionChanged: (Set<Gender> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          genderView = newSelection.first;
        });
      },
    );
  }
}
